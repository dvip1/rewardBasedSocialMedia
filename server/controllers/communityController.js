const communityModel = require('../models/communityModel');
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
   try{
    const { communityId } = req.body;
    const community = await communityModel.findOne({ _id: communityId }).lean().exec();
    if (community) res.json(community);
    else res.status(404).json({ message: "community not found" });
}
    catch(error){
    res.status(500).json({ message: "Failed to get community", error });

}
};

communityController.getAllTasks = async (req, res) => {
    try{
    const { communityId } = req.body;
    const community = await communityModel.findOne({ _id: communityId }).lean().exec();
    if (community) res.json(community.tasks);
    else res.status(404).json({ message: "community not found" });
}
    catch(error){
    res.status(500).json({ message: "Failed to get community", error });

}
}

module.exports = communityController;  