import Router from "express";

import {
  acceptOrder,
  cancelOrder,
  getIncomingOrder,
  placeOrder,
} from "../controllers/order.js";
const router = Router();

router.post("/place_order", placeOrder);
router.delete("/:id/cancel_order/:order_id", cancelOrder);
router.get("/:id/incoming", getIncomingOrder);
router.patch("/:id/accept_order/:order_id", acceptOrder);

export default router;
