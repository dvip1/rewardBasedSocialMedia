const userController = require("../controllers/userController");
const authorize = require("../middleware/authorize");
const router = require("express").Router();

router.route("/get").get(userController.getAllUser);

router.route("/get/:userId").get(userController.getUser);

router.route("/update").put(userController.update);

router.route("/myProfile").get(authorize, userController.getUserProfile);
router.route("/connctions").get(authorize, userController.getAllConnections);

module.exports = router;
