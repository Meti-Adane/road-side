import Router from "express";
import { getAllUsers, getUserByID, addNewUser } from "../controllers/user.js";

var router = Router();

router.get("/", getAllUsers);
router.get("/:id", getUserByID);
router.post("/register", addNewUser);

export default router;
