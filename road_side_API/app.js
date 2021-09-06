import express from "express";
import routes from "./app/routes/index.js";
const userRouter = routes.userRouter;
const garageRouter = routes.garageRouter;
const locationRouter = routes.locationRouter;
const orderRouter = routes.orderRouter;
// import dotenv from 'dotenv';

// dotenv.config();

const app = express();

app.use(express.urlencoded({ extended: true }));
app.use(express.json());

app.use("/api/users", userRouter);
app.use("/api/garages", garageRouter);
app.use("/api/locations", locationRouter);
app.use("/api/order", orderRouter);

export default app;
