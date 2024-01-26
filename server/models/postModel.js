const mongoose = require('mongoose')

const postSchema = new mongoose.Schema({
    content: {
        type: String,
        required: true
    },
    media: String,
    author: {
        type: String,
        required: true
    },
    authorId: {
        type: String,
        required: true
    },
    support: {
        type: Number,
        default: 0
    }
}, { timestamps: true })

module.exports = mongoose.model("Post", postSchema);