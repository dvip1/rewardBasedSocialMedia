const communityController = require("../controllers/communityController");
const router = require("express").Router();

const authorize = require("../middleware/authorize");

router
  .route("/make_community")
  .post(authorize, communityController.createCommunity);

router.route("/community").get(communityController.getAllCommunity);
router.route("/community/:communityId").get(communityController.getCommunity);
router.route("/join_community").post(authorize, communityController.addMember);
module.exports = router;
