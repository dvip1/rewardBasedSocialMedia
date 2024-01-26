const communityModel = require('../models/communityModels');
const communityController = {};


communityController.createCommunity = async (req, res) => {
    try {
        const { name, description, leader } = req.body;
        const newCommunity = await communityModel.create({
            name,
            description,
            leader
        });
        res.json(newCommunity._id);
    } catch (error) {
        res.status(500).json({ message: "Failed to create community", error });
    }
};

communityController.getCommunity = async (req, res) => {
    try {
        const communityId = req.params.communityId;
        const community = await communityModel.findOne({ _id: communityId }).lean().exec();
        if (community) res.json(community);
        else res.status(404).json({ message: "community not found" });
    } catch (error) {
        res.status(500).json({ message: "Failed to get community", error });
    }
};  

communityController.getAllCommunity = async (req, res) => {
    try {
        const communities = await communityModel.find({}).lean().exec();
        if (communities) res.json(communities);
        else res.status(404).json({ message: "community not found" });
    } catch (error) {
        res.status(500).json({ message: "Failed to get community", error });
    }
}

communityController.addMember = async (req, res) => {
    try{
    const { communityId, userId } = req.body;
    const community = await communityModel.findOne({ _id: communityId }).lean().exec();
    if (community) {
        await communityModel.findByIdAndUpdate(
            { _id: communityId },
            {
                $push: {
                    members: userId,
                },
            }
        );
        res.json({ message: "Member added successfully" });
    }
    else res.status(404).json({ message: "community not found" });
}
    catch(error){
    res.status(500).json({ message: "Failed to add member", error });

}
}
communityController.getAllCommunity = async (req, res) => {
    try{
    const communities = await communityModel.find({}).lean().exec();
    if (communities) res.json(communities);
    else res.status(404).json({ message: "community not found" });
}
    catch(error){
    res.status(500).json({ message: "Failed to get community", error });
}
};

module.exports = communityController;  