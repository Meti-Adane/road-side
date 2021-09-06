import Router from "express";
import {
  getAllUsers,
  getUserByID,
  addNewUser,
  deleteUser,
  getUserOrderHistory,
  getUsersOnGoingServices,
} from "../controllers/user.js";

var router = Router();

router.get("/", getAllUsers);
router.get("/:id", getUserByID);
router.post("/register", addNewUser);
router.delete("/:id", deleteUser);
router.get("/:id/order_history", getUserOrderHistory);

export default router;
