import User  from '../model/User.js'
export const getAllUsers = (req, res) => {
  res.status(200).send({
    message: "OK",
    users: [{name:"meti"}, {name:"Adane"}]
  }).end();
};

export const getUserByID = (req, res) => {
  const user_id = req.params._id
  console.log("============================================")
  console.log(req.params)
  console.log("==========================================", user_id)
  if (!user_id) {
    res.status(400).send({message:"BAD REQUEST id needs to be specified"}).end();
  }
  User.findById(user_id)
  .then(data => {
    if (!data) {
      return res.status(404).send({message: "USER NOT FOUND"}).end()
    }
    res.status(200).send({message:"OK", user: data}).end()

  }).catch (error => {
    if (error.name === "CastError") {
      return res.status(400).send({message: "BAD REQUEST INVLAID ID TYPE "}).end()
    } 
    return res.status(500).send({message: "INTERNAL SERVER ERROR"}).end()
  }) 
  

};
export const AddUser = (req, res) => {
  console.log(User)
  const new_user = new User(
    {
    first_name:"Abebaw",
  last_name:"kelelaw",
  username:"kelelawAbe",
  password:"12345k",
  phoneNumber: "0932439999",
  email:"kelelaw@yahoo.com"
  
}
  )


  try {
    new_user.save();
    res.status(201).json(new_user);
    
  } catch (error) {
    console.log(error);
    res.status(400).send({message: "BAD REQUEST"}).end();
  };
  
}
// export const addNewUser = (req, res) => {
//   try {
//     // Get user input
//     const { first_name, last_name, email, phoneNumber, password } = req.body;

//     // Validate user input
//     if (!(password && first_name && phoneNumber && last_name)) {
//       res.status(400).send({ message: "Content can not be empty!" });
//     }

//     // Validate if user exist in our database
//     const existingUser = await User.findOne({ phoneNumber });

//     if (existingUser) {
//       return res.status(409).send("User Already Exist.");
//     }

//     //Encrypt password
//     encryptedPassword = await bcrypt.hash(password, 10);

//     // Create user in our database
//     req.body.password = encryptedPassword;
//     const user = await User.create({
//       first_name,
//       last_name,
//       email: email.toLowerCase(),
//       phoneNumber,
//       password: encryptedPassword,
//       profile_picture: req.body.profile_picture,
//     });

//     // Create token
//     const token = jwt.sign(
//       { user_id: user._id, email },
//       process.env.TOKEN_KEY,
//       {
//         expiresIn: "2h",
//       }
//     );
//     // save user token
//     user.token = token;

//     // return new user
//     res.status(201).json(user);
//   } catch (err) {
//     console.log(err);
//   }
//   // Our register logic ends here
// };

export const deleteUser = (req, res) => {};

export const updateProfile = (req, res) => {};

export const getUsersOnGoingServices = (req, res) => {};
