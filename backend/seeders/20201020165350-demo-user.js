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
		return queryInterface.bulkInsert("Users", [
			{
				id: "6",
				username: "Admin",
				email: "admin@demo.com",
				password:
					"$2b$10$szjfy4bMmgsLW38s631Dj.UgnC9UrA1b7sifLbfrxrZZf5qp/wVny",
				avatar: "http://localhost:3000/images/admin.jpg",
				isAdmin: true,
				bio: "Administrateur",
				createdAt: new Date(),
				updatedAt: new Date(),
			},
			{
				id: "7",
				username: "Carole",
				email: "carole@demo.com",
				password:
					"$2b$10$QOfFstF6N1fsWJ0F6e7ovOrxlSyKirF5/nR101gCEv2CBV/1MyW76",
				avatar: "http://localhost:3000/images/carole.jpg1625508174653.jpg",
				isAdmin: false,
				bio: "Développeuse web",
				createdAt: new Date(),
				updatedAt: new Date(),
			},
			{
				id: "9",
				username: "Océane",
				email: "oceane@demo.com",
				password:
					"$2b$10$89IBWEgRxNsvS92veG33huTiFLlQhO6QxFoyzGHcccBtroKYs1OUe",
				avatar: "http://localhost:3000/images/océane.jpg1625509091123.jpg",
				isAdmin: false,
				bio: "Commerciale",
				createdAt: new Date(),
				updatedAt: new Date(),
			},
			{
				id: "8",
				username: "Jonas",
				email: "jonas@demo.com",
				password:
					"$2b$10$OHRaNFZ/bP52I/aipoobuubh64v4xGcS0UI9PL6yWqB1EQFYd7EhS",
				avatar: "http://localhost:3000/images/jonas.jpg1625508641105.jpg",
				isAdmin: false,
				bio: "Comptable",
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
		return queryInterface.bulkDelete("Users", null, {});
	},
};
