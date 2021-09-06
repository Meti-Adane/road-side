import User from "../model/User.js";
import Garage from "../model/Garage.js";
import Order from "../model/Order.js";
import Service from "../model/Service.js";
import Location from "../model/Location.js";

//  place order with isPlaced = pending
//  notify garage
//  if garage does accepts update isPlaced to accepted
// if garage cancels update is placed to rejected

// isplaced should be --- pending , accepted, rejected
// order status should be -- inprogress or completed to be changed on cancel order and complete order

export const placeOrder = async (req, res) => {
  console.log("place order called");
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

  const newOrder = await new Order(order).save();

  if (!newOrder) {
    return res.status(500).send({ message: "SERVER INTERNAL ERROR" });
  }
  return res.status(201).send({ message: "CREATED ", order: newOrder });
};
