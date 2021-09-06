import Router from "express";
import {
  getAllUsers,
  getUserByID,
  addNewUser,
  deleteUser,
  getUserOrderHistory,
  getUserOnGoingServices,
} from "../controllers/user.js";

var router = Router();

router.get("/", getAllUsers);
router.get("/:id", getUserByID);
router.post("/register", addNewUser);
router.delete("/:id", deleteUser);
router.get("/:id/order_history", getUserOrderHistory);
router.get("/:id/active_services", getUserOnGoingServices);

export default router;
