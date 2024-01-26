const userController = require("../controllers/userController");
const router = require("express").Router();

router.route("/get")
    .get(userController.getAllUser)

router.route("/get/:userId")
    .get(userController.getUser)

router.route("/update")
    .put(userController.update)

module.exports = router;
