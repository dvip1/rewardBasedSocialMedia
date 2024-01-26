require("dotenv").config();
const express = require("express");
const mongoose = require("mongoose");
const logger = require("morgan");
const connectDB = require("./configs/connect.js");
const app = express();

app.use(logger("dev"));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cors());

connectDB();

// routes
app.use("/post", require("./routes/postsRoute"));
app.use("/auth", require("./routes/authRoute"));
app.use("/user", require("./routes/userRoute"));
app.use("/community", require("./routes/communityRoutes"));

const PORT = process.env.PORT || 5000;

mongoose.connection.once("open", () => {
  console.log("connected to db");
  app.listen(PORT, () => {
    console.log(`server started at ${PORT}`);
  });
});

mongoose.connection.on("error", (error) => {
  console.log(error);
});
