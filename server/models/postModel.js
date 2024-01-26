const mongoose = require('mongoose')

const commentSchema = new mongoose.Schema({
    commentorId: {
        type: mongoose.Schema.Types.ObjectId,
        required: true,
        ref: 'User'
    },
    comment: {
        type: String,
        required: true,
        trim: true
    },
    timestamp: {
        type: Date,
        default: Date.now
    }
});

const postSchema = new mongoose.Schema({
    media: {
        type: String,
        required: [true, 'Content cannot be empty'],
    },
    caption: {
        type: String,
        trim: true
    },
    likes: {
        type: Number,
        default: 0
    },
    comments: [commentSchema]
}, { timestamps: true })

postSchema.index({ authorId: 1 });

module.exports = mongoose.model("Post", postSchema);