const router = require("express").Router();
const communityController = require("../controllers/communityController");

router.route('/join-community-room').post(communityController.joinCommunityRoom);
module.exports = router