// @flow

const express = require("express");
const helmet = require("helmet");
const logger = require("morgan");

const routes = require("./routes");

const app = express();

app.use(helmet());

const target = app.get("env");
if (target === "development") {
  app.use(logger("dev"));
} else if (target === "production") {
  app.use(logger("combined"));
}

app.use("/", routes);

module.exports = app;
