-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 19 juil. 2021 à 16:05
-- Version du serveur :  8.0.25
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `v2_groupomania`
--

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `UserId` int NOT NULL,
  `MessageId` int NOT NULL,
  `content` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `UserId` (`UserId`),
  KEY `MessageId` (`MessageId`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `comments`
--

INSERT INTO `comments` (`id`, `UserId`, `MessageId`, `content`, `createdAt`, `updatedAt`) VALUES
(5, 7, 8, 'Trop sympaaaa !!!!', '2021-07-05 19:29:32', '2021-07-05 19:29:32'),
(8, 10, 8, 'Je ne manquerai pas ça 🎊', '2021-07-05 19:38:19', '2021-07-05 19:38:19'),
(9, 7, 10, 'SUPER !!', '2021-07-06 12:07:27', '2021-07-06 12:07:27'),
(21, 6, 12, 'Si l\'administrateur peut venir, c\'est avec plaisir :)', '2021-07-15 14:00:33', '2021-07-15 14:00:33'),
(25, 8, 8, 'Merci !!', '2021-07-17 20:45:49', '2021-07-17 20:45:49');

-- --------------------------------------------------------

--
-- Structure de la table `likes`
--

DROP TABLE IF EXISTS `likes`;
CREATE TABLE IF NOT EXISTS `likes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `UserId` int NOT NULL,
  `MessageId` int NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `UserId` (`UserId`),
  KEY `MessageId` (`MessageId`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `likes`
--

INSERT INTO `likes` (`id`, `UserId`, `MessageId`, `createdAt`, `updatedAt`) VALUES
(4, 8, 6, '2021-07-05 18:14:52', '2021-07-05 18:14:52'),
(7, 7, 8, '2021-07-05 19:29:39', '2021-07-05 19:29:39'),
(8, 7, 6, '2021-07-05 19:30:48', '2021-07-05 19:30:48'),
(10, 10, 8, '2021-07-05 19:37:52', '2021-07-05 19:37:52'),
(12, 6, 10, '2021-07-06 11:23:25', '2021-07-06 11:23:25'),
(20, 6, 14, '2021-07-13 08:20:00', '2021-07-13 08:20:00'),
(32, 8, 14, '2021-07-14 21:37:46', '2021-07-14 21:37:46'),
(33, 8, 12, '2021-07-14 22:08:58', '2021-07-14 22:08:58'),
(40, 8, 10, '2021-07-15 14:01:20', '2021-07-15 14:01:20'),
(42, 50, 14, '2021-07-16 16:11:01', '2021-07-16 16:11:01'),
(43, 50, 12, '2021-07-16 16:11:49', '2021-07-16 16:11:49');

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `UserId` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `UserId` (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `messages`
--

INSERT INTO `messages` (`id`, `UserId`, `title`, `content`, `attachment`, `createdAt`, `updatedAt`) VALUES
(6, 6, 'Bonjour !', 'Bienvenu sur le nouveau réseau social de Groupomania ! ✨', 'http://localhost:3000/images/icon-left-font-monochrome-black.png1625507555135.png', '2021-07-05 17:52:35', '2021-07-05 17:52:35'),
(8, 8, 'Anniversaire 🎂', 'A l\'occasion de mon anniversaire, j\'ai ramené un gâteau 🍰 RDV en salle de pause à 16h !!', NULL, '2021-07-05 18:13:56', '2021-07-05 18:13:56'),
(10, 10, 'On a signé avec THE client !!!', 'VICTOIRE !!! RDV à la réunion demain matin à 8h30 pour connaître la bonne nouvelle 🍾', 'http://localhost:3000/images/photofunky.gif1625513820228.gif', '2021-07-05 19:37:00', '2021-07-05 19:37:00'),
(12, 7, 'Café à 16h ? ☕', 'Qui de dispo ?', NULL, '2021-07-06 16:11:45', '2021-07-06 16:11:45'),
(14, 8, 'Passez tous de bonnes vacances !', 'A bientôt !!', 'http://localhost:3000/images/vacances.gif1626134914681.gif', '2021-07-13 00:08:34', '2021-07-14 21:16:13');

-- --------------------------------------------------------

--
-- Structure de la table `sequelizemeta`
--

DROP TABLE IF EXISTS `sequelizemeta`;
CREATE TABLE IF NOT EXISTS `sequelizemeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('20200927175233-create-user.js'),
('20200927175237-create-message.js'),
('20200927175834-create-comment.js'),
('20201011134106-create-like.js');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `bio` text,
  `isAdmin` tinyint(1) NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `email`, `username`, `password`, `avatar`, `bio`, `isAdmin`, `createdAt`, `updatedAt`) VALUES
(6, 'admin@demo.com', 'admin', '$2b$10$p751/G96CfWxde/ZjWKsauzbTnd8bZTpayIZ1M92aB9Sko8mbqSPi', 'http://localhost:3000/images/admin.jpg1625507456963.jpg', 'Shérif du réseau social', 1, '2021-07-05 17:50:16', '2021-07-13 08:21:04'),
(7, 'carole@demo.com', 'Carole', '$2b$10$IEsQbG0csAxKXONItrr9j.2rXTtbcxtGoN8kOTtamRLgeq8s/XlKq', 'http://localhost:3000/images/carole.jpg1625508174653.jpg', 'Développeuse web', 0, '2021-07-05 18:02:16', '2021-07-06 16:11:14'),
(8, 'jonas@demo.com', 'Jonas', '$2b$10$OHRaNFZ/bP52I/aipoobuubh64v4xGcS0UI9PL6yWqB1EQFYd7EhS', 'http://localhost:3000/images/jonas.jpg1625508641105.jpg', 'Comptable', 0, '2021-07-05 18:05:57', '2021-07-15 07:37:58'),
(10, 'boss@demo.com', 'The Boss', '$2b$10$VpB9JQDr8xXkFOtClLSyBOAJsc49tiOMPa0ObU9anHKI.XUyNshO6', 'http://localhost:3000/images/boss.jpg1625513666185.jpg', 'The Boss', 0, '2021-07-05 19:32:47', '2021-07-05 19:34:26'),
(20, 'james@demo.com', 'james', '$2b$10$ztrMXaSXulJCTPMacrnFEOuvFzTzGv8x4.wfYBiM6Cbg/KrneVIRe', 'http://localhost:3000/images/avatar.png', 'Veuillez compléter votre profil...', 0, '2021-07-08 14:40:37', '2021-07-08 14:40:37'),
(26, 'oscar@demo', 'Oscar', '$2b$10$5UeHZUnoX8WcaR1r1i04muJbQmZwrfzGdtgCiWKsOnjUoDiPrbfwS', 'http://localhost:3000/images/marc.jpg1626173401590.jpg', 'Commercial', 0, '2021-07-13 10:41:53', '2021-07-13 10:50:10'),
(28, 'cecile@demo.com', 'Cécile', '$2b$10$xuHSDYHbeKMamoGDzxyHPOkiphZeJ4MuNKoT3oIIT45L/AfdC6sRe', 'http://localhost:3000/images/avatar.png', 'Veuillez compléter votre profil...', 0, '2021-07-14 06:50:29', '2021-07-14 06:50:29'),
(50, 'jeanne@demo.com', 'jeanne', '$2b$10$V.g94zGDV4usLfobFbkxBeTNzDIkHOdNexw9z83BUmMNwxjugBasm', 'http://localhost:3000/images/jeanne.jpg1626451774088.jpg', 'secrétaire', 0, '2021-07-16 16:08:10', '2021-07-16 16:09:34'),
(52, 'janisse@demo.com', 'Janisse', '$2b$10$ZymCQtyg.Ogt8whdzORzwu35crdd9akzl3GYyuwSKhtZ3fc1dhsU2', '', 'Veuillez compléter votre profil...', 0, '2021-07-17 22:10:22', '2021-07-17 22:10:22'),
(53, 'claude@demo.com', 'claude', '$2b$10$pcswP5BuZr3RABxmdf.dHuH04I20VyYDNCAtmc0mYxSZ3G2PFMHvO', '', 'Veuillez compléter votre profil...', 0, '2021-07-18 09:09:20', '2021-07-18 09:09:20'),
(54, 'damien@demo.com', 'damien', '$2b$10$qUO4zOd36xQPv0cWCmGXW.aAvS6C3sg3bCH9CGHgcNdKltBa0nMiG', '', 'Veuillez compléter votre profil...', 0, '2021-07-18 10:42:45', '2021-07-18 10:42:45');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`MessageId`) REFERENCES `messages` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`MessageId`) REFERENCES `messages` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
