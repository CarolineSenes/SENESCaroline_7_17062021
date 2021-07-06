"use strict";

module.exports = {
	up: async (queryInterface, Sequelize) => {
		/**
		 * Add seed commands here.
		 *
		 * Example:
		 * await queryInterface.bulkInsert('People', [{
		 *   name: 'John Doe',
		 *   isBetaMember: false
		 * }], {});
		 */
		return queryInterface.bulkInsert("Messages", [
			{
				UserId: "6",
				title: "Bonjour !",
				content: "Bienvenu sur le nouveau réseau social de Groupomania ! ✨",
				attachment: "http://localhost:3000/images/icon-left-font-monochrome-black.png1625507555135.png",
				createdAt: new Date(),
				updatedAt: new Date(),
			},
			{
				UserId: "7",
				title: "Présentation 🖐",
				content:
					"Bonjour à toutes et tous ! Je suis Carole la nouvelle développeuse web.",
				createdAt: new Date(),
				updatedAt: new Date(),
			},
			{
				UserId: "8",
				title: "Anniversaire 🎂",
				content:
					"A l'occasion de mon anniversaire, j'ai ramené un gâteau 🍰 RDV en salle de pause à 16h !!",
				createdAt: new Date(),
				updatedAt: new Date(),
			},
			{
				UserId: "9",
				title: "Naissance 👶",
				content:
					"Valentine est née hier à 4h30. Toute la famille se porte à merveille ;-)",
				attachment: "http://localhost:3000/images/valentine.jpg1625509181416.jpg",
				createdAt: new Date(),
				updatedAt: new Date(),
			},

		]);
	},

	down: async (queryInterface, Sequelize) => {
		/**
		 * Add commands to revert seed here.
		 *
		 * Example:
		 * await queryInterface.bulkDelete('People', null, {});
		 */
		return queryInterface.bulkDelete("Messages", null, {});
	},
};
