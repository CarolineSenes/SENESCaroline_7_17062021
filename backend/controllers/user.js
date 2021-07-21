////////// contient logique métier pour user //////////

const bcrypt = require("bcrypt");
const db = require("../models");
const jwt = require("jsonwebtoken");
const fs = require("fs");
require("dotenv").config();

REGEX_USERNAME = /^[a-zéèàêâùïüëA-Z-\s\']{5,30}$/;
REGEX_PASSWORD = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,20}$/;
REGEX_EMAIL = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
exports.register = (req, res) => {
	if (!REGEX_PASSWORD.test(req.body.password)) {
		return res.status(400).json({
			error: "Le mot de passe doit contenir entre 6 et 20 caractères",
		});
	}
	if (!REGEX_EMAIL.test(req.body.email)) {
		return res.status(400).json({
			error: "Le format d'email n'est pas valide",
		});
	}
	if (!REGEX_USERNAME.test(req.body.username)) {
		return res.status(400).json({
			error: "Le nom d'utilisateur doit comprendre entre 5 et 30 caractère",
		});
	}
	db.User.findOne({
		where: { email: req.body.email },
	})
		.then((userFound) => {
			if (!userFound) {
				bcrypt.hash(req.body.password, 10).then((hash) => {
					db.User.create({
						email: req.body.email,
						username: req.body.username,
						avatar: "",
						bio: "Veuillez compléter votre profil...",
						password: hash,
						isAdmin: 0,
					})
						.then((user) => {
							res.status(201).json({
								message: "Utilisateur créé !",
								id: user.id
							});
						})
						.catch((error) => res.status(400).json({ error }));
				});
			} else {
				res.status(409).json({
					error: "Cet utilisateur existe déjà",
				});
			}
		})
		.catch((error) => res.status(500).json({ error }));
};

exports.login = (req, res) => {
	db.User.findOne({ where: { email: req.body.email } })
		.then((user) => {
			if (!user) {
				return res.status(401).json({ error: "Utilisateur non trouvé ! " });
			}
			bcrypt
				.compare(req.body.password, user.password)
				.then((valid) => {
					if (!valid) {
						return res.status(401).json({ error: "Mot de passe incorrect !" });
					}

					res.status(200).json({
						userId: user.id,
						isAdmin: user.isAdmin,
						username: user.username,
						token: jwt.sign(
							{
								userId: user.id,
							},
							process.env.JWT_TOKEN,
							{ expiresIn: "24h" }
						),
					});
				})
				.catch((error) => res.status(400).json({ error }));
		})
		.catch((error) => res.status(500).json({ error }));
};

exports.getUserProfile = (req, res) => {
	db.User.findOne({
		attributes: ["username", "email", "bio", "avatar", "isAdmin", "id"],
		where: { id: req.params.id },
	})
		.then((user) => {
			if (user) {
				res.status(200).json(user);
			} else {
				res.status(404).json({ error: "Utilisateur non trouvé" });
			}
		})
		.catch((error) => {
			res.status(500).json({ error: "Impossible de voir le profil" });
		});
};

exports.updateProfile = (req, res, next) => {
    const userObject = req.file ?
        {
            ...req.body,
            avatar: `${req.protocol}://${req.get("host")}/images/${req.file.filename}`
        } : { ... req.body}
    db.User.update({ ...userObject, id:  req.params.id}, { where: { id: req.params.id }})
      .then(() => res.status(200).json({ ...userObject }))
      .catch(error => res.status(400).json({ error }))
}

exports.deleteProfile = (req, res, next) => {
	db.User.findOne({ where: { id: req.params.id } })
	  .then((user) => {
		const filename = user.avatar.split("/images/")[1];
		fs.unlink(`images/${filename}`, () => {
		  db.User.destroy({ where: { id: req.params.id } })
			.then(res.status(200).json({ message: "profil supprimé" }))
			.catch((error) => res.status(400).json({ error }));
		});
	  })
	  .catch((error) => res.status(500).json({ error }));
  };