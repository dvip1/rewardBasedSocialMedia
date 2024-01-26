const mongoose = require("mongoose");
const bcrypt = require("bcryptjs");

const userSchema = new mongoose.Schema(
  {
    username: {
      type: String,
      required: true,
      unique:true
    },
    profileImage: String,
    email: {
      type: String,
      required: true,
      unique: true,
      match: /.+\@.+\..+/,
    },
    password: {
      type: String,
      required: true,
      set: (value) => bcrypt.hashSync(value, 10),
    },
    streaks: {
      type: Number,
      default: 0,
    },
    karmas: {
      type: Number,
      default: 0,
    },
    posts: [String],
    likedPosts: [String],
    connections: [String],
    badges: [String],
    communities: [ mongoose.Schema.Types.ObjectId],
  },
  { timestamps: true }
);

module.exports = mongoose.model("User", userSchema);
