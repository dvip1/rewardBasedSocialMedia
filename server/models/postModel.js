const mongoose = require("mongoose");

const postSchema = new mongoose.Schema(
  {
    authorId: {
      type: mongoose.Schema.Types.ObjectId,
      required: true,
      ref: "User",
    },
    media: {
      type: String,
      required: [true, "Content cannot be empty"],
    },
    caption: {
      type: String,
      trim: true,
    },
    likes: {
      type: Number,
      default: 0,
    },
    comments: [
      {
        commentorId: {
          type: mongoose.Schema.Types.ObjectId,
          required: true,
          ref: "User",
        },
        comment: {
          type: String,
          required: true,
          trim: true,
        },
        timestamp: {
          type: Date,
          default: Date.now,
        },
      },
    ],
  },
  { timestamps: true }
);

postSchema.index({ authorId: 1 });

module.exports = mongoose.model("Post", postSchema);
