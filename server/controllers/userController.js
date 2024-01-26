const { default: mongoose } = require("mongoose");
const userModel = require("../models/userModel");

const userController = {};

userController.getUserProfile = async (req, res) => {
  try {
    const userId = req.user.id;
    const user = await userModel.findById(userId);

    if (!user) {
      return res.status(404).json({ message: "User not found" });
    }

    res.status(200).json(user);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Server error" });
  }
};
userController.update = async (req, res) => {
  const { name, email, userId } = req.body;

  if (!mongoose.isValidObjectId(userId))
    return res.status(404).json({ message: "userId is not valid" });

  if (!name.trim() || !email.trim())
    return res.status(400).json({ message: "all fields required" });
  try {
    const updated = await userModel
      .findByIdAndUpdate(
        { _id: userId },
        { name: name, email: email },
        { new: true }
      )
      .select("name email");

    if (updated) res.json(updated);
    else res.json({ message: "failed to update, user not found" });
  } catch (e) {
    return res.status(500).json(e);
  }
};

userController.getUser = async (req, res) => {
  const userId = req.params.userId;
  if (!mongoose.isValidObjectId(userId))
    return res.status(404).json({ message: "userId is not valid" });
  const user = await userModel
    .findOne({ _id: userId })
    .select("-password")
    .lean()
    .exec();
  if (user) res.json(user);
  else res.json({ message: "user not found" });
};

userController.getAllUser = async (req, res) => {
  const user = await userModel.find({}).select("name email").lean().exec();
  res.json(user);
};

userController.getAllConnections = async (req, res) => {
  const userId = req.user.id;
  console.log(userId);
  if (!mongoose.isValidObjectId(userId))
    return res.status(404).json({ message: "userId is not valid" });

  const connections = await userModel
    .findById({ _id: userId })
    .select("connections")
    .lean()
    .exec();
  res.json(connections);
};

module.exports = userController;
