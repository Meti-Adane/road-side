import bcrypt from "bcryptjs";
import jwt from "jsonwebtoken";
import Garage from "../model/Garage.js";

export const getAllGarages = (req, res) => {
  Garage.find(
    {},
    "_id name description opening_hour closing_hour location services contact"
  )
    .then((data) => {
      if (!data) {
        res
          .status(204)
          .send({ messgage: "NO CONTENT no garges registered" })
          .end();
      } else {
        res.status(200).send({ messgage: "OK", garages: data });
      }
    })
    .catch((err) => {
      res
        .status(500)
        .send({ messgage: err || "INTERNAL SERVER ERROR" })
        .end();
    });
};

export const getGarageById = (req, res) => {};

export const addNewGarage = (req, res) => {
  let garage = req.body;

  if (!(garage && Object.keys(garage).length >= 9)) {
    return res
      .status(400)
      .send({ message: "BAD REQUEST missing inputs" })
      .end();
  }
  const query = {
    $or: [{ name: garage.name }, { user_name: garage.user_name }],
  };

  Garage.find(query)
    .then((data) => {
      if (data.length) {
        res
          .status(409)
          .send({ message: "CONFLICT Garage already in registered" })
          .end();
      } else {
        //Encrypt password
        bcrypt
          .hash(garage.password, 10)
          .then((data) => {
            garage.password = data;
            const newGarage = new Garage(garage);
            newGarage
              .save()
              .then((data) => {
                if (data) {
                  const token = jwt.sign(
                    { id: garage._id, user_name: garage.user_name },
                    process.env.TOKEN_KEY,
                    {
                      expiresIn: "2h",
                    }
                  );
                  // save user token
                  garage = data;
                  garage.token = token;
                  res.status(201).send({ message: "CREATED", garage }).end();
                }
              })
              .catch((err) => {
                res
                  .status(500)
                  .send({ message: "Error on saving garage" + err })
                  .end();
              });
          })

          .catch((err) =>
            res
              .status(500)
              .send(err || "HASHING")
              .end()
          );
      }
    })
    .catch((err) => {
      res
        .status(500)
        .send({ message: "Error on checking if garage exists" })
        .end();
    });
};

export const deleteGarage = (req, res) => {};
