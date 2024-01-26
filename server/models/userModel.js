const mongoose = require('mongoose');
const bcrypt = require('bcryptjs');

const userSchema = new mongoose.Schema({
    name: {
        type: String,
        required: true
    },
    email: {
        type: String,
        required: true,
        unique: true,
        match: /.+\@.+\..+/
    },
    password: {
        type: String,
        required: true,
        set: value => bcrypt.hashSync(value, 10)
    },
    birthday: Date,
    gender: {
        type: String,
        enum: ['male', 'female']
    },
    profession: String,
    posts: [String],
    supportedPosts: [String]
}, { timestamps: true });

module.exports = mongoose.model("User", userSchema)

