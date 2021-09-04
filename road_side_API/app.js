import express from 'express';
import router from './app/routes/garage.js';
import routes  from './app/routes/index.js';
const userRouter = routes.userRouter;
const garageRouter = routes.garageRouter
const locationRouter = routes.locationRouter
// import dotenv from 'dotenv';

// dotenv.config();

const app = express();

app.use(express.urlencoded({extended: true}));
app.use(express.json());

app.use('/api/users', userRouter);
app.use('/api/garages', garageRouter);
app.use('/api/locations', locationRouter)



export default app;