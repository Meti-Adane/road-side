import Router from "express";

import {
  acceptOrder,
  cancelOrder,
  getIncomingOrder,
  placeOrder,
} from "../controllers/order";
const router = Router();

router.put("/place_order", placeOrder);
router.delete("/cancel_order", cancelOrder);
router.get("/order_request", getIncomingOrder);
router.patch("/accept_order", acceptOrder);

//0913430583
