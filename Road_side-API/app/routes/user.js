import Router from 'express';
import { getAllUsers } from '../controllers/user.js';

var router = Router();

router.get("/", (req, res) =>{
    res.status(200).send("<h1>All users</h1>")
});

export default router;