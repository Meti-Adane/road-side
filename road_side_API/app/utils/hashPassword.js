import bcrypt from "bcryptjs";

export const hash = async (plain_password) =>
  bcrypt
    .hash(plain_password, 10)
    .then((data) => {
      if (!data) res.status(500).send("ERROR ON HASH").end();
      console.log(data, "***********");
      return data;
    })
    .catch((err) => {
      console.log(err);
      res
        .status(500)
        .send({ message: err + "ERROR ON HASH" })
        .end();
    });
