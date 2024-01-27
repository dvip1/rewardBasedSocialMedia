const communityController = require("../controllers/communityController");
const router = require("express").Router();

const authorize = require("../middleware/authorize");

router.route('/mycommunities')
    .get(authorize, communityController.userCommunities)
    
router.route("/community")
  .post(authorize, communityController.createCommunity)
  .get(communityController.getAllCommunity)
  .put(authorize, communityController.addMember)
 
router.route('/community/createTask')
    .post(authorize, communityController.createTask)

router.route("/community/:communityId")
  .get(communityController.getCommunity)



module.exports = router;
