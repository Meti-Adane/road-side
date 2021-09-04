import Router from 'express';
import { getAllUsers, getUserByID, AddUser } from '../controllers/user.js';

var router = Router();

router.get("/", getAllUsers);
router.get("/:_id", getUserByID);


export default router;