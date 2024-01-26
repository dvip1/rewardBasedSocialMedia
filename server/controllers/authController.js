const userModel = require("../models/userModel");
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const multer = require("multer");
const authController = {};

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "./uploads");
  },
  filename: function (req, file, cb) {
    const ext = path.extname(file.originalname);
    const uniqueSuffix = Date.now() + "-" + Math.round(Math.random() * 1e9);
    cb(null, file.fieldname + "-" + uniqueSuffix + ext);
  },
});

const upload = multer({ storage: storage });
authController.signup = async (req, res) => {
  const { name, email, password } = req.body;

  if (!name.trim() || !email.trim() || !password.trim())
    return res.status(400).json({ message: "all fields required" });
  else if (password.length < 8)
    return res.status(400).json({ message: "password length is too short" });

  try {
    const existingUser = await userModel.findOne({ email }).lean().exec();
    if (existingUser)
      return res.status(409).json({ message: "Email already used" });

    const user = await userModel.create({
      name,
      email,
      password,
      profileImage: req.file ? req.file.filename : undefined,
    });

    if (user) res.status(201).json({ message: "user created" });
    else res.status(400).json({ message: "invalid user data received" });
  } catch (error) {
    res.status(500).json({ message: "server error" });
  }
};

authController.signin = async (req, res) => {
  const { email, password } = req.body;

  if (!email.trim() || !password.trim())
    return res.status(400).json({ message: "all fields required" });

  const existingUser = await userModel
    .findOne({ email })
    .select("password")
    .lean()
    .exec();

  if (!existingUser)
    return res.status(400).json({ message: "email not found" });

  const passwordMatch = await bcrypt.compare(password, existingUser.password);

  if (!passwordMatch)
    return res.status(401).json({ message: "wrong password" });

  const token = jwt.sign({ id: existingUser._id }, process.env.TOKEN_SECRET);

  res.json({ token });
};

module.exports = authController;
