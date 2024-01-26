const communityController = require('../controllers/communityController');
const router= require('express').Router();

router.route('/make_community')
    .post(communityController.createCommunity)

router.route('/community/:communityId')
    .get(communityController.getCommunity)


module.exports = router;