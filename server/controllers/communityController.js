const communityModel = require('../models/communityModel');
const communityController = {};
communityController.createCommunity = async (req, res) => {
    try {
        const { name, description, leader, tasks } = req.body;
        const newCommunity = await communityModel.create({
            name,
            description,
            leader,
            tasks
        });
        res.json(newCommunity._id);
    } catch (error) {
        res.status(500).json({ message: "Failed to create community", error });
    }
};

communityController.getCommunity = async (req, res) => {
    try {
        const communityId = req.params.communityId;
        if (!mongoose.isValidObjectId(communityId)) {
            return res.status(404).json({ message: "Invalid communityId" });
        }

        const community = await communityModel.findById(communityId).populate('members').lean().exec();
        if (!community) {
            return res.status(404).json({ message: "Community not found" });
        }

        res.json(community);
    }
    catch (error) {
        res.status(500).json({ message: "Failed to get community", error });
    }
}

module.exports = communityController;  