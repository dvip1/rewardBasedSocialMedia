const mongoose = require("mongoose");

const communityModel = require("../models/communityModels");
const userModel = require("../models/userModel");

const connectionController = {};

connectionController.getUserData = async (req, res) => {
  const { connectionName } = req.body;

  const userId = req.user.id;
  if (!mongoose.isValidObjectId(userId))
    return res.status(404).json({ message: "userId is not valid" });

  const connectionUser = await userModel.findOne({ username: connectionName });
  if (!connectionUser)
    return res.status(404).json({ message: "connection not found" });
  if (connectionUser) {
    const connectionId = connectionUser._id;
    const connectionUserName = connectionUser.username;
    console.log(connectionId, connectionUserName);
    connectionUserData = {
      connectionId,
      connectionUserName,
    };
    res.status(200).json(connectionUserData);
  }
  res.status(500).json({ message: "No user found with that username :(" });
};

connectionController.addConnection = async (req, res) => {
  try {
    const userId = req.user.id;
    const { connectionId } = req.body;

    // Check if userId and connectionId are valid ObjectIds
    if (
      !mongoose.isValidObjectId(userId) ||
      !mongoose.isValidObjectId(connectionId)
    ) {
      return res
        .status(400)
        .json({ message: "Invalid userId or connectionId" });
    }

    // Check if userId and connectionId exist in the database
    const user = await userModel.findById(userId);
    const connectionUser = await userModel.findById(connectionId);

    if (!user || !connectionUser) {
      return res.status(404).json({ message: "User or connection not found" });
    }

    // Check if the connection is already added
    if (
      user.connections.includes(connectionId) ||
      connectionUser.connections.includes(userId)
    ) {
      return res.status(400).json({ message: "Connection already added" });
    }

    // Avoid self-connections
    if (userId === connectionId) {
      return res.status(400).json({ message: "Cannot connect to yourself" });
    }

    // Add connection for both users
    await userModel.findByIdAndUpdate(userId, {
      $push: { connections: connectionId },
    });
    await userModel.findByIdAndUpdate(connectionId, {
      $push: { connections: userId },
    });

    res.json({ message: "Connection added" });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Server error" });
  }
};

module.exports = connectionController;
