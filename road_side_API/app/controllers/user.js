import User from "../model/User.js";
import bcrypt from "bcryptjs";
import { ObjectId } from "bson";
export const getAllUsers = (req, res, next) => {
  res
    .status(200)
    .send({
      message: "OK",
      users: [{ name: "meti" }, { name: "Adane" }],
    })
    .end();
};

export const getUserByID = (req, res, next) => {
  const user_id = req.params.id;
  if (!user_id) {
    res
      .status(400)
      .send({ message: "BAD REQUEST id needs to be specified" })
      .end();
  }
  User.findById(user_id)
    .then((data) => {
      if (!data) {
        return res.status(404).send({ message: "USER NOT FOUND" }).end();
      }
      res.status(200).send({ message: "OK", user: data }).end();
    })
    .catch((error) => {
      if (error.name === "CastError") {
        return res
          .status(422)
          .send({ message: "BAD REQUEST INVLAID ID TYPE " })
          .end();
      }
      return res.status(500).send({ message: "INTERNAL SERVER ERROR" }).end();
    });
};
export const addNewUser = async (req, res, next) => {
  let user = req.body;
  if (!user) {
    return res
      .status(400)
      .send({ message: "BAD REQUEST missing inputs" })
      .end();
  }
  const query = {
    $or: [{ user_name: user.user_name }, { email: user.email }],
  };
  const existing_user = await User.find(query);
  if (existing_user.length) {
    return res.status(409).send("User already exists").end();
  } else {
    try {
      //Encrypt password
      user.password = await bcrypt.hash(user.password, 10);
      const newUser = await new User(user).save();
      res.status(201).send({ message: "Created", newUser }).end();
    } catch (err) {
      res.status(500).send({ message: err || "ERROR ON SAVING" });
    }
  }
};
export const deleteUser = async (req, res) => {
  const id = req.params.id;
  if (!id)
    return res
      .status(400)
      .send({ messgage: "BAD REQUEST missing inputs" })
      .end();
  if (!ObjectId.isValid(id))
    return res
      .status(422)
      .send({ message: "Unprocessable Entity invalid id type" })
      .end();

  const userExists = await User.findById(id);
  if (!userExists) {
    return res
      .status(404)
      .send({ messgage: "NOT FOUND no User with this id" })
      .end();
  } else {
    try {
      const deletedUser = await User.findByIdAndRemove(id);
      return res
        .status(204)
        .send({ messgage: "NO CONTENT User deleted", deletedUser });
    } catch (error) {
      return res
        .status(500)
        .send({ message: error || "INTERNAL SERVER ERROR", deletedUser })
        .end();
    }
  }
};

export const updateProfile = (req, res) => {};

export const getUsersOnGoingServices = (req, res) => {};
