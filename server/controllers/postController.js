const postModel = require("../models/postModel");
const { default: mongoose } = require("mongoose");
const userModel = require("../models/userModel");

const postController = {};

postController.addPost = async (req, res) => {
    const { content, author } = req.body;
    const userId = req.user.id;
    if (!mongoose.isValidObjectId(userId)) return res.status(404).json({ message: "userId is not valid" })

    const newPost = await postModel.create({
        content: content,
        author: author,
        authorId: userId
    })

    await userModel.findByIdAndUpdate({ _id: userId },
        {
            "$push": {
                posts: newPost._id
            }
        }
    )

    if (newPost) res.json(newPost)
    else res.json({ message: "failed to create post" })
}

postController.getPost = async (req, res) => {
    const postId = req.params.postId;
    const post = await postModel.findOne({ _id: postId }).lean().exec();
    if (post) res.json(post)
    else res.status(404).json({ message: "post not found" })
}

postController.getUserPost = async (req, res) => {
    const userId = req.params.userId;
    if (!mongoose.isValidObjectId(userId)) return res.status(404).json({ message: "userId is not valid" })
    const posts = await postModel.find({authorId:userId}).limit(20).lean().exec();
    res.json(posts)
}



postController.deletePost = async (req, res) => {
    const postId = req.params.postId;
    if (!mongoose.isValidObjectId(postId)) return res.status(404).json({ message: "postId is not valid" })
    const userId = req.user.id;
    if (!mongoose.isValidObjectId(userId)) return res.status(404).json({ message: "userId is not valid" })

    await userModel.findByIdAndUpdate(
        { _id: userId },
        {
            "$pull": {
                posts: postId
            }
        }
    )

    await postModel.findByIdAndDelete({ _id: postId })
    res.json({ message: "post deleted" })
}


postController.updatePost = async (req, res) => {
    const { content, author, postId } = req.body;

    const updatedPost = await postModel.findByIdAndUpdate(
        { _id: postId },
        { content: content, author: author },
        { new: true });
    res.json({ message: "post updated", data: updatedPost })
}

module.exports = postController;