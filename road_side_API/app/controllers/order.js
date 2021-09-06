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
    user_id: req.body.user_id,
    is_pending: "pending",
  });

  if (
    !(
      ObjectId.isValid(req.body.user_id) &&
      ObjectId.isValid(req.body.garage_id) &&
      ObjectId.isValid(req.body.service_id)
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

export const getIncomingOrder = (req, res) => {
  const garage_id = req.params.id;

  if (!garage_id) res.statu(400).send("BAD REQUEST");

  Order.findOne({ garage_id: garage_id, is_pending: true }, (err, order) => {
    if (err) res.status(500).send(err || "INTERNAL SERVER ERROR");
    res.status(200).send({
      message: "OK",
      pending_order: order,
    });
  });
};

export const completeOrder = (req, res) => {
  const order_id = req.body.order_id;
  const garage_id = req.body.garage_id;
  const updateDocument = { completed_at: req.body.completed_at || Date.now };

  const query = { id: order_id, garage_id: garage_id };
  Order.updateOne(query, updateDocument, (err, data) => {
    if (!data)
      res
        .status(404)
        .send("CONTENT NOT FOUND couldnt find order with garage id");
    res.status(200).send({
      message: "OK order marked as complete",
    });
  });
};

export const cancelOrder = (req, res) => {
  const { user_id, order_id } = req.body;
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

export const acceptOrder = async (req, res) => {};
