import bcrypt from "bcryptjs";
import jwt from "jsonwebtoken";
import Garage from "../model/Garage.js";
import Location from "../model/Location.js";

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

export const getGarageById = (req, res) => {
  const id = req.params.id;

  if (!id)
    res.status(400).send({ messgage: "BAD REQUEST missing inputs" }).end();

  Garage.findById(id)
    .then((data) => {
      if (!data)
        return res
          .status(404)
          .send({ messgage: "NOT FOUND no garage with this id" })
          .end();
      res.status(200).send({ messgage: "OK", garage: data });
    })
    .catch((error) => {
      if (error.name === "CastError") {
        return res
          .status(400)
          .send({ message: "BAD REQUEST INVLAID ID TYPE " })
          .end();
      } else {
        return res.status(500).send({ message: "INTERNAL SERVER ERROR" }).end();
      }
    });
};

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
        res.status(409).send("Garage already exists").end();
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
                  const updateDocument = {
                    $push: { garages_available: data._id },
                  };
                  garage.location.forEach((location) => {
                    const query = { name: location };
                    Location.updateOne(query, updateDocument)
                      .then((data) => {
                        if (!data) {
                          return res
                            .status(404)
                            .send({ messgae: "NOT FOUND couldnt update" })
                            .end();
                        }
                        return res.status(200).send({ message: "OK" }).end();
                      })
                      .catch((err) => {
                        return res
                          .statu(500)
                          .send({ messgae: err || "INTERNAL SERVER error" })
                          .end();
                      });
                  });
                  const token = jwt.sign(
                    { id: garage._id, user_name: garage.user_name },
                    process.env.TOKEN_KEY,
                    {
                      expiresIn: "2h",
                    }
                  );
                  // save garage token
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

export const updateGarage = (req, res) => {
  if (!req.body) {
    return res
      .status(400)
      .send({
        message: "Data to update can not be empty!",
      })
      .end();
  }

  const id = req.params.id;
  const isLocationUPdated = req.body.location.length != 0;
  console.log(isLocationUPdated);
  Garage.findByIdAndUpdate(id, req.body)
    .then((data) => {
      if (!data) {
        res
          .status(404)
          .send({
            message: `NOT FOUND`,
          })
          .end();
      } else
        res
          .status(201)
          .send({
            message: "Garage updated",
            garage: data,
          })
          .end();
    })
    .catch((err) => {
      res
        .status(500)
        .send({
          message: err || "Error updating Tutorial with id=" + id,
        })
        .end();
    });
};
export const deleteGarage = (req, res) => {
  const id = req.params.id;

  if (!id)
    res.status(400).send({ messgage: "BAD REQUEST missing inputs" }).end();

  Garage.findByIdAndRemove(id)
    .then((data) => {
      if (!data)
        return res
          .status(404)
          .send({ messgage: "NOT FOUND no garage with this id" })
          .end();
      return res.status(204).send({ messgage: "NO CONTENT deleted" });
    })
    .catch((error) => {
      if (error.name === "CastError") {
        return res
          .status(400)
          .send({ message: "BAD REQUEST invalid id type" })
          .end();
      }
      return res.status(500).send({ message: "INTERNAL SERVER ERROR" }).end();
    });
};
