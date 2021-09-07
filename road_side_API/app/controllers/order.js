import User from "../model/User.js";
import Garage from "../model/Garage.js";
import Order from "../model/Order.js";
import Service from "../model/Service.js";
import Location from "../model/Location.js";
import { ObjectId } from "bson";

//  place order with isPlaced = pending
//  notify garage
//  if garage does accepts update isPlaced to accepted
// if garage cancels update is placed to rejected

// isplaced should be --- pending , accepted, rejected
// order status should be -- inprogress or completed to be changed on cancel order and complete order

export const placeOrder = async (req, res) => {
  let order = req.body;
  if (!(Object.keys(order).length >= 3))
    return res.status(400).send("BAD REQUEST missing inputs").end();

  if (!order.description || order.description === "") {
    const requested_service = await Service.findById(order.service_id);
    order.description = requested_service.name;
  }

  if (typeof order.issued_date !== Date) {
    order.issued_date = Date.now();
  }
  const userHasPendingOrder = await Order.findOne({
    user_id: order.user_id,
    is_pending: "pending",
  });

  if (
    !(
      ObjectId.isValid(order.user_id) &&
      ObjectId.isValid(order.garage_id) &&
      ObjectId.isValid(order.service_id)
    )
  )
    return res.status(422).send({ message: "CONFLICT" }).end();
  if (userHasPendingOrder)
    return res
      .status(409)
      .send({ message: "CONFLICT user has pending request" })
      .end();

  const newOrder = await new Order(order).save();

  if (!newOrder) {
    return res.status(500).send({ message: "SERVER INTERNAL ERROR" });
  }

  const updateDocument = {
    $push: { incoming_requests: order.garage_id },
  };
  const notifyGargae = await Garage.findByIdAndUpdate(
    order.garage_id,
    updateDocument
  );
  return res.status(201).send({ message: "CREATED ", order: newOrder });
};

export const getIncomingOrder = async (req, res) => {
  const garage_id = req.params.id;

  if (!garage_id) res.status(400).send("BAD REQUEST");

  const pendingOrder = await Order.findOne({
    garage_id: garage_id,
    is_pending: true,
  })
    .populate("user_id", "first_name phone_number user_name")
    .populate("service_id", "name");
  if (!pendingOrder)
    return res.status(404).send({ message: "NOT FOUND no pending order" });
  return res.status(200).send({
    message: "OK",
    pendingOrder,
  });
};

export const completeOrder = async (req, res) => {
  const order = req.body;
  const order_id = order.order_id;

  const garage_id = req.params.id;

  const updateDocument = [
    { completed_at: order.completed_at || Date.now },
    { status: "completed" },
  ];

  const query = { id: order_id, garage_id: garage_id };
  const order_detail = await Order.findById(order_id).populate("user_id");
  console.log(order_detail.user_id.first_name);
  // remove from ongoing services for user
  // remove from on going services for garage
  // update status of order to completed
  // update user history

  // update order status to completed
  const compltedOrder = Order.updateOne(query, updateDocument, (err, data) => {
    if (!completeOrder)
      return res
        .status(404)
        .send("CONTENT NOT FOUND couldnt find order with garage id");
    //remove from on going services for user

    return res.status(201).send({
      message: "OK order marked as complete",
      order: completeOrder,
    });
  });
};

export const cancelOrder = async (req, res) => {
  const id = req.params.id;
  const order_id = req.params.order_id;
  const query = { user_id: user_id, id: order_id, is_pending: true };
  Order.deleteOne(query, (err, data) => {
    if (!data)
      res
        .status(404)
        .send("CONTENT NOT FOUND order already placed / doesnt exist");
    res.status(204).send({
      message: "NO CONTENT order deleted",
    });
  });
};

export const rejectOrder = async (req, res) => {};

// add to users ongoing service
// add to garages on going service
// remove from incoming requests
// change order status to accepted

export const acceptOrder = async (req, res) => {
  const id = req.params.id;
  const order_id = req.params.order_id;

  if (!(id && order_id))
    return res.status(400).send({ message: "BAD REQUEST" });
  if (!ObjectId.isValid(id) && ObjectId.isValid(order_id)) {
    return res
      .status(422)
      .send({ message: "Unprocessable Entity invalid id type" })
      .end();
  }

  const order = await Order.findById(order_id);

  if (!(order && order.is_placed == "pending")) {
    return res.status(404).send({ message: "NOT FOUND" });
  }
  try {
    // updated order status
    const updatedOrder = await Order.findByIdAndUpdate(order_id, {
      is_placed: "accepted",
      status: "ongoing",
    });
    // updated garage table
    const garageUpdateDocument = {
      $pull: { incoming_requests: order_id },
      $push: { ongoing_services: order_id },
    };
    const updatedGarge = await Garage.findByIdAndUpdate(
      order.garage_id,
      garageUpdateDocument
    );

    // update user status
    const userUpdateDocument = {
      $push: { ongoing_services: order_id },
    };
    const updatedUser = await Garage.findByIdAndUpdate(
      order.user_id,
      userUpdateDocument
    );
    const newOrder = await Order.findById(order_id)
      .populate("user_id", "first_name email user_name phone_number")
      .populate("service_id", "name");
    return res.status(201).send({ message: "CREATED", order: newOrder });
  } catch (error) {
    return res.status(500).send({ message: "SERVER INTERNAL ERROR" });
  }
};
