require("dotenv").config();
const express = require("express");
const path = require("path");
const helmet = require("helmet");
const cors = require("cors");
const rateLimit = require('express-rate-limit');

//100 requêtes toutes les 15min par IP
const apiLimiter = rateLimit({
	windowMs: 15 * 60 * 1000,
	max: 100
  });

const app = express();

app.use('/api', apiLimiter); 

const userRoutes = require("./routes/user");
const messageRoutes = require("./routes/message");
const commentRoutes = require("./routes/comment");

const db = require("./models");

//Connexion à la base de données
db.sequelize
	.authenticate()
	.then(() => {
		console.log("Connecté à la base de données avec succès");
	})
	.catch((error) => {
		console.log("Impossible de se connecter à la base de données : ", error);
	});

app.use(cors());

//En-têtes HTTP
app.use(helmet());
app.use((req, res, next) => {
	res.setHeader("Access-Control-Allow-Origin", "*");
	res.setHeader(
		"Access-Control-Allow-Headers",
		"Origin, X-Requested-With, Content, Accept, Content-Type, Authorization"
	);
	res.setHeader(
		"Access-Control-Allow-Methods",
		"GET, POST, PUT, DELETE, PATCH, OPTIONS"
	);
	next();
});

app.use(express.json());

app.use("/images", express.static(path.join(__dirname, "images")));

app.use("/api/users", userRoutes);
app.use("/api/messages", messageRoutes);
app.use("/api/messages", commentRoutes);

module.exports = app;
