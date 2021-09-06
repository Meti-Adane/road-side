import Router from "express";
import {
  getAllUsers,
  getUserByID,
  addNewUser,
  deleteUser,
} from "../controllers/user.js";

var router = Router();

router.get("/", getAllUsers);
router.get("/:id", getUserByID);
router.post("/register", addNewUser);
router.delete("/:id", deleteUser);

export default router;
