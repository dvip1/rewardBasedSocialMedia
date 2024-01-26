const authorize = require("../middleware/authorize");
const router = require("express").Router();
const connectionController = require("../controllers/connectionController");

router
  .route("/addConnection")
  .post(authorize, connectionController.addConnection);

router.route("/getUserData").post(authorize, connectionController.getUserData);

module.exports = router;
