import User from "../model/User.js";
import bcrypt from "bcryptjs";
import jwt from "jsonwebtoken";
import { addNewUser } from "./user.js";
import { addNewGarage } from "./garage.js";
export const login = async (req, res) => {
  const { user_name, password, role } = req.body;
  if (!(user_name && password))
    return res.status(400).send({ message: "BAD REQUEST" });
  try {
    let user;
    if (role === "user") {
      user = await User.findOne({ user_name });
    }
    if (role === "admin") {
      user = await User.findOne({ user_name });
    }
    if (role === "garage") {
      user = await User.findOne({ user_name });
    }

    if (user && (await bcrypt.compare(password, user.password))) {
      const token = jwt.sign(
        { user_id: user.id, user_name },
        process.env.TOKEN_KEY,
        {
          expiresIn: "2h",
        }
      );

      // save user token
      let newUser = user;
      newUser.token = token;
      console.log(token);
      console.log("===========", newUser.token);
      return res.status(200).send({ messgage: "OK", user: newUser }).end();
    }

    return res.status(400).send("Invalid Credentials");
  } catch (error) {
    console.log(error);
    res.status(500).send({ message: "INTERNAL SERVER ERROR" });
  }
};

export const signUp = async (req, res, next) => {
  const url = req.url;

  switch (url) {
    case "/garage/register":
      addNewUser();
      break;
    case "/users/register":
      addNewGarage();
      break;
  }
};
