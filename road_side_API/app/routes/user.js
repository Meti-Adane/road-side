import Router from "express";
import {
  getAllUsers,
  getUserByID,
  addNewUser,
  deleteUser,
  getUserOrderHistory,
  getUserOnGoingServices,
  updateUser,
} from "../controllers/user.js";

var router = Router();

router.get("/", getAllUsers);
router.get("/:id", getUserByID);
router.get("/:id/order_history", getUserOrderHistory);
router.get("/:id/active_services", getUserOnGoingServices);
router.post("/register", addNewUser);
router.delete("/:id", deleteUser);
router.put("/:id", updateUser);

export default router;
