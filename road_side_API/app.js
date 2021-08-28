import express from 'express';
import routes  from './app/routes/index.js';
const userRouter = routes.userRouter;
// import dotenv from 'dotenv';

// dotenv.config();

const app = express();

app.use(express.urlencoded({extended: true}));
app.use(express.json());

app.use('/api/users', userRouter);


export default app;