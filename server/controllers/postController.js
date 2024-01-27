const postModel = require("../models/postModel");
const { default: mongoose } = require("mongoose");
const userModel = require("../models/userModel");

const postController = {};

postController.addPost = async (req, res) => {
  const { caption } = req.body;
  const userId = req.user.id;
  if (!mongoose.isValidObjectId(userId))
    return res.status(404).json({ message: "userId is not valid" });

  const user = await userModel.findOne({_id:userId}).select("username").lean().exec()
  const newPost = await postModel.create({
    caption: caption,
    media: `${req.protocol}://${req.headers.host}/uploads/${req.file.filename}`,
    authorId: user.username,
  });

  await userModel.findByIdAndUpdate(
    { _id: userId },
    {
      $push: {
        posts: newPost._id,
      },
    }
  );

  if (newPost) res.json(newPost);
  else res.json({ message: "failed to create post" });
};

postController.getPost = async (req, res) => {
  const postId = req.params.postId;
  const post = await postModel.findOne({ _id: postId }).lean().exec();
  if (post) res.json(post);
  else res.status(404).json({ message: "post not found" });
};

postController.getUserPost = async (req, res) => {
  const userId = req.params.userId;
  if (!mongoose.isValidObjectId(userId))
    return res.status(404).json({ message: "userId is not valid" });
  const posts = await postModel
    .find({ authorId: userId })
    .limit(20)
    .lean()
    .exec();
  res.json(posts);
};

postController.myPosts = async (req, res) => {
  const userId = req.user.id;
  if (!mongoose.isValidObjectId(userId))
    return res.status(404).json({ message: "userId is not valid" });
  const posts = await postModel
    .find({ authorId: userId })
    .limit(20)
    .lean()
    .exec();
    console.log(posts);
  res.json(posts);
};

postController.deletePost = async (req, res) => {
  const postId = req.params.postId;
  if (!mongoose.isValidObjectId(postId))
    return res.status(404).json({ message: "postId is not valid" });
  const userId = req.user.id;
  if (!mongoose.isValidObjectId(userId))
    return res.status(404).json({ message: "userId is not valid" });

  await userModel.findByIdAndUpdate(
    { _id: userId },
    {
      $pull: {
        posts: postId,
      },
    }
  );

  await postModel.findByIdAndDelete({ _id: postId });
  res.json({ message: "post deleted" });
};

postController.updatePost = async (req, res) => {
  const { content, author, postId } = req.body;

  const updatedPost = await postModel.findByIdAndUpdate(
    { _id: postId },
    { content: content, author: author },
    { new: true }
  );
  res.json({ message: "post updated", data: updatedPost });
};

postController.addComment = async (req, res) => {
  const { comment } = req.body;
  const postId = req.params.postId;
  const commentorId = req.user.id;

  if (!mongoose.isValidObjectId(postId)) {
    return res.status(404).json({ message: "postId is not valid" });
  }

  try {
    // Await the result of the findById query
    let post = await postModel.findById(postId);

    if (!post) {
      return res.status(404).json({ message: "Post not found" });
    }

    const newComment = {
      commentorId: commentorId,
      comment: comment,
    };

    // Make sure the comments array exists before pushing
    if (!post.comments) {
      post.comments = [];
    }

    post.comments.push(newComment);

    // Update the comments directly in the database
    await postModel.updateOne(
      { _id: postId },
      { $set: { comments: post.comments } }
    );

    res.json(newComment);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Server error" });
  }
};

postController.addLike = async (req, res) => {
  const postId = req.params.postId;
  const { likes } = req.body;

  try {
    const post = await postModel.findById(postId);
    const user = await userModel.findById(post.authorId);

    if (!post) {
      return res.status(404).json({ message: "Post not found" });
    }

    if (!user) {
      return res.status(404).json({ message: "User not found" });
    }
    const prevLikes = post.likes;
    const prevKarma = user.karmas;
    const newLikes = prevLikes + parseInt(likes);
    const newKarma = prevKarma + parseInt(likes) * 2;

    await postModel.updateOne({ _id: postId }, { $set: { likes: newLikes } });

    await userModel.updateOne(
      { _id: post.authorId },
      { $set: { karmas: newKarma } }
    );

    res.json({ message: "Like Updated" });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Server error" });
  }
};
module.exports = postController;
