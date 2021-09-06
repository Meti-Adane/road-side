import Router from "express";

import {
  acceptOrder,
  cancelOrder,
  getIncomingOrder,
  placeOrder,
} from "../controllers/order.js";
const router = Router();

router.post("/place_order", placeOrder);
router.delete("/cancel_order", cancelOrder);
router.get("/order_request", getIncomingOrder);
router.patch("/accept_order", acceptOrder);

export default router;
