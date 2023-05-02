const mongoose = require("mongoose");
const validator = require("validator");

const companySchema = new mongoose.Schema({
  name: {
    type: String,
    required: [false, "Please enter company name"],
    trim: true,
    maxLength: [100, "company name cannot exceed 100 characters"],
  },

  description: {
    type: String,
    required: [false, "Please enter company description"],
    trim: true,
    maxLength: [1000, "company description cannot exceed 1000 characters"],
  },

  phone: {
    type: String,
    required: [false, "Please enter company phone"],
    trim: true,
    maxLength: [100, "company phone cannot exceed 100 characters"],
  },

  email: {
    type: String,
    required: [true, "Please enter your email"],
    validate: [validator.isEmail, "Please enter valid email address"],
  },
  location: {
    type: String,
    required: [false, "Please enter company location"],
    trim: true,
    maxLength: [100, "company location cannot exceed 100 characters"],
  },
  companyImage: {
    data: String,
  },
});

module.exports = mongoose.model("Company", companySchema);
