const communityController = require("../controllers/communityController");
const router = require("express").Router();

const authorize = require("../middleware/authorize");

router.route("/community")
  .post(authorize, communityController.createCommunity)
  .get(communityController.getAllCommunity)
  .put(authorize, communityController.addMember)

router.route("/community/:communityId")
  .get(communityController.getCommunity)

module.exports = router;
