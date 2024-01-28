const mongoose = require("mongoose");
let db_url = "";

if (process.env.NODE_ENV === "pro")
  db_url = process.env.REMOTE_DATABASE_URL || "";
else db_url = process.env.MONGO_SECRET_URI;

mongoose.set("strictQuery", false);
const connectDB = async () => {
  try {
    await mongoose.connect(db_url);
  } catch (error) {
    console.log(error);
  }
};

module.exports = connectDB;
