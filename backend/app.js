const express = require("express");
const app = express();

const cookieParser = require("cookie-parser");
const bodyParser = require("body-parser");
const dotenv = require("dotenv");
const path = require("path");

const errorMiddleware = require("./middlewares/errors");

// Setting up config file
// if (process.env.NODE_ENV !== 'PRODUCTION') require('dotenv').config({ path: 'backend/config/config.env' })
dotenv.config({ path: "backend/config/config.env" });

app.use(express.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(cookieParser());

// Import all routes
const file = require("./routes/file");
const auth = require("./routes/auth");
const companies = require("./routes/company");
const job = require("./routes/job");
const order = require("./routes/application");

app.use("/assets", file);
app.use("/api/v1", auth);
app.use("/api/v1", companies);
app.use("/api/v1", job);
app.use("/api/v1", order);

// Middleware to handle errors
app.use(errorMiddleware);

module.exports = app;
