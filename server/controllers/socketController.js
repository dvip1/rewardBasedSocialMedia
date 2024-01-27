const { default: mongoose } = require("mongoose");
const userModel = require("../models/userModel");

const socketController = {};

const socketio = require("socket.io");

socketController.roomController = {
   
  createRoom: (server) => {
    const io = socketio(server);

    io.on("connection", (socket) => {
      socket.on("join-room", (roomId, userId) => {
        socket.join(roomId);
        socket.to(roomId).broadcast.emit("user-connected", userId);

        socket.on("disconnect", () => {
          socket.to(roomId).broadcast.emit("user-disconnected", userId);
        });
      });
    });
  },
};

module.exports = socketController;
