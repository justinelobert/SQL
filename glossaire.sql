-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le :  mar. 05 mars 2019 à 13:48
-- Version du serveur :  10.1.37-MariaDB
-- Version de PHP :  7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `glossaire`
--

-- --------------------------------------------------------

--
-- Structure de la table `saisie`
--

CREATE TABLE `saisie` (
  `id` int(11) NOT NULL,
  `mot` varchar(45) NOT NULL,
  `definition` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `saisie`
--

INSERT INTO `saisie` (`id`, `mot`, `definition`) VALUES
(1, 'donnée', 'Élément d\'information servant de point de départ à un raisonnement.'),
(2, 'information', 'Action d\'informer ou de s\'informer sur quelque chose.'),
(3, 'base de donnée', 'Grande quantité de données stockées pour être interrogées par un logiciel.'),
(4, 'SGBD', 'SGBD signifie Système de Gestion de Bases de Données. C\'est un ensemble de logiciels permettant de manipuler des bases de données, c\'est à dire de les créer, de les organiser et de les utiliser.'),
(5, 'SQL', 'SQL signifie, Structured Query Language. Il permet de désigner un langage utilisé dans les bases de données informatiques pour effectuer des opérations de recherche, d\'ajout de suppression ou de modification. ');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `saisie`
--
ALTER TABLE `saisie`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `saisie`
--
ALTER TABLE `saisie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
