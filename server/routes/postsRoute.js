const postController = require("../controllers/postController");
const authorize = require("../middleware/authorize");
const router = require("express").Router();

router.route("/post")
    .post(authorize, postController.addPost)
    .put(authorize, postController.updatePost)

router.route("/post/:postId")
    .get(authorize, postController.getPost)
    .delete(authorize, postController.deletePost)

router.route("/user/:userId")
    .get(postController.getUserPost)

module.exports = router;