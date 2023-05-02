const mongoose = require("mongoose");
const validator = require("validator");

const jobSchema = new mongoose.Schema({
  company: {
    type: mongoose.Schema.Types.ObjectId,
    required: true,
    ref: "Company",
  },

  title: {
    type: String,
    required: [false, "Please enter job title"],
    trim: true,
    maxLength: [100, "job title cannot exceed 100 characters"],
  },

  description: {
    type: String,
    required: [false, "Please enter job description"],
  },

  requirements: {
    type: String,
    required: [false, "Please enter job reqyirements"],
  },
  responsibilities: {
    type: String,
    required: [false, "Please enter job responsibilities"],
  },
  createdAt: {
    type: Date,
    default: Date.now,
  },
});

module.exports = mongoose.model("Job", jobSchema);
