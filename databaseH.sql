-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3307
-- Généré le : sam. 08 juil. 2023 à 22:02
-- Version du serveur : 10.10.2-MariaDB
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `hirfa`
--

-- --------------------------------------------------------

--
-- Structure de la table `administrateur`
--

DROP TABLE IF EXISTS `administrateur`;
CREATE TABLE IF NOT EXISTS `administrateur` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `Firstname` text NOT NULL,
  `Lastname` text NOT NULL,
  `email` text NOT NULL,
  `phonenumber` int(100) NOT NULL,
  `password` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `administrateur`
--

INSERT INTO `administrateur` (`id`, `Firstname`, `Lastname`, `email`, `phonenumber`, `password`) VALUES
(1, 'mohamed', 'zarouali', 'admin1@gmail.com', 562178072, 'Admin1');

-- --------------------------------------------------------

--
-- Structure de la table `demande`
--

DROP TABLE IF EXISTS `demande`;
CREATE TABLE IF NOT EXISTS `demande` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `professionId` int(11) NOT NULL,
  `message` text NOT NULL,
  `status` int(11) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `demande_user_id` (`userId`),
  KEY `demande_profession_id` (`professionId`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `demande`
--

INSERT INTO `demande` (`id`, `userId`, `professionId`, `message`, `status`, `date`) VALUES
(24, 29, 6, 'viens', 2, '2023-06-29'),
(25, 29, 5, 'comme', 0, '2023-06-22'),
(27, 29, 15, 'aider moi', 2, '2023-06-23'),
(28, 29, 9, 'vien ', 0, '2023-06-23'),
(29, 29, 15, 's\'il vous plaÃ®t aidez  moi  ', 1, '2023-06-24'),
(30, 29, 15, 'pouvez vous m\'aider ce soir ? ', 1, '2023-06-24'),
(31, 29, 15, 'j\'ai besoin d\'un travail la semaine prochaine ', 1, '2023-06-25'),
(32, 29, 15, 's\'il vous plaÃ®t aidez moi en urgence ', 0, '2023-07-14'),
(33, 29, 15, 'j\'ai besoin d aide la semaine prochaine ', 0, '2023-07-30'),
(37, 29, 5, 'aide moi', 0, '2023-07-23');

-- --------------------------------------------------------

--
-- Structure de la table `profession`
--

DROP TABLE IF EXISTS `profession`;
CREATE TABLE IF NOT EXISTS `profession` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `experience` int(11) NOT NULL,
  `description` text NOT NULL,
  `pricePerHour` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_professions_contrainte` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `profession`
--

INSERT INTO `profession` (`id`, `title`, `experience`, `description`, `pricePerHour`, `userId`) VALUES
(5, 'ManÅ“uvre', 10, 'Je suis une personne qui fait bien son travail', 1000, 31),
(6, 'Peintre', 8, 'Je suis une personne qui fait bien son travail', 1000, 32),
(8, 'ManÅ“uvre', 10, 'Je suis une personne qui fait bien son travail', 1000, 34),
(9, 'MÃ©canicien', 15, 'Je suis une personne qui fait bien son travail', 1800, 35),
(10, 'plombier', 3, 'Je suis une personne qui fait bien son travail', 900, 36),
(11, 'Ã‰lectricien', 3, 'Je suis une personne qui fait bien son travail', 900, 37),
(12, 'Menuisier', 6, 'Je suis une personne qui fait bien son travail', 1100, 38),
(13, 'Peintre', 8, 'Je suis une personne qui fait bien son travail', 700, 39),
(14, 'MÃ©canicien', 6, 'Je suis une personne qui fait bien son travail', 2500, 40),
(15, 'Menuisier', 5, 'Je suis une personne qui fait bien son travail', 1000, 42);

-- --------------------------------------------------------

--
-- Structure de la table `review`
--

DROP TABLE IF EXISTS `review`;
CREATE TABLE IF NOT EXISTS `review` (
  `idUser` int(11) NOT NULL,
  `idProfession` int(11) NOT NULL,
  `note` int(11) NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`idUser`,`idProfession`),
  KEY `review_id_profession_contraine` (`idProfession`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `review`
--

INSERT INTO `review` (`idUser`, `idProfession`, `note`, `comment`) VALUES
(29, 5, 5, 'khdma chaba  ! '),
(29, 6, 4, 'da3mouh khawti  '),
(29, 9, 5, 'khdma chaba khawti nensahkoum bih  '),
(29, 10, 5, 'je suis trÃ¨s satisfait '),
(29, 11, 5, 'il fait un excellent travail '),
(29, 12, 5, 'il fait un excellent travail, je le recommande '),
(29, 13, 4, 'excellent travail, je suis tellement heureux '),
(29, 15, 1, 'je ne suis pas satisfait du travail qu\'il a fait');

-- --------------------------------------------------------

--
-- Structure de la table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionKey` text NOT NULL,
  `creationDate` datetime NOT NULL DEFAULT current_timestamp(),
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniqueSessionKey` (`sessionKey`) USING HASH,
  KEY `user_sessions_foreign_key` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `sessions`
--

INSERT INTO `sessions` (`id`, `sessionKey`, `creationDate`, `userId`) VALUES
(42, 'hirfa7ol8f378bke7p74c688bejcvjlappcvjnlm7drlcq05put2g60f7ea9', '2023-06-12 14:51:57', 32),
(43, 'hirfao0hjol16p9ahkevh8rurdluoepapploc5d7n9aqd8251lj17ttsn7v9', '2023-06-12 15:03:08', 32),
(44, 'hirfa70bvct0433n3ipah86lgl5fnjiappv2fuk3k3bkmo8htn5vcn5ihts9', '2023-06-12 15:03:23', 32),
(45, 'hirfa26m4u46edq1rhke8efj3nv9q2mappvsblc35ohp3ht1fo8orat3knmd', '2023-06-12 15:03:30', 32),
(48, 'hirfal1r1ntd2vpipatpio24qufi2fhapp10hfsch777onb3qecmmev956sp', '2023-06-12 15:09:28', 32),
(81, 'hirfacitatohdpsq69u80jbsgebvdtlappgvut3q3e6l499mg7srvgqad5vf', '2023-06-17 09:40:45', 29),
(87, 'hirfa6opig0klsceos6u7u9evts2ng0app6b8o0m7gpp3iqotk5nh88vsqjf', '2023-06-17 12:16:09', 32),
(102, 'hirfabib6c9uoaup0295e5s3u1tp7kaappe2lr9v0rsha209fq78vfvlok3f', '2023-06-19 17:36:22', 29),
(121, 'hirfad3hmi6tip0n11ef70j79f23ataappi1jaqv5e10hnqos99ejng09sdo', '2023-06-24 06:39:05', 29),
(128, 'hirfa4dblvbb8ugb7cs6tg9cc917j2sappbqafdhpa5ptn8v0mvd7ujhmbmk', '2023-06-24 08:39:06', 29),
(129, 'hirfaavu8aocs04g5291nhktc0gbkshappogssb071t3qd4sn8iq3gijfqcj', '2023-07-03 14:34:36', 29),
(130, 'hirfa3dcnf35eg3hn3hls32ce7jh06aapps10lrpq58c3h8idad3i728o4at', '2023-07-03 14:34:36', 29);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` text DEFAULT NULL,
  `lastName` text DEFAULT NULL,
  `phoneNumber` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `email` (`email`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`userId`, `firstName`, `lastName`, `phoneNumber`, `email`, `password`) VALUES
(29, 'abdelhak', 'ghebbache', '0744224466', 'abd@gmail.com', '$2y$10$MWz2Ikd6WuzOim8kIzxz9.LckKXBnbjq/u/MvItsBl8bBO7COjz6S'),
(31, 'abdelhak', 'ghebbache', '05555', 'abdough@gmail.com', '$2y$10$20EpcW0B.XPcRkEOqpNzhu7EsU0ecrL/qyo4aMSt9Ws7f40uvncEq'),
(32, 'rafik', 'bennabi', '0566443241', 'rafiq.bennabi@gmail.com', '$2y$10$XpGKK9tk09ue68M5DvZQ.ezihbKnP4wHDlB4hoXW2V4nXvq8QnHfC'),
(34, 'Rauf', 'Sohali', '0541537322', 'Rauf.sohali@gmail.com', '$2y$10$O0OCnTYwT.HueR.J0HVbpuf1ffFv0FKjf8aIZlF8h..YtjCdGSvBu'),
(35, 'amin', 'Bouchiba', '0772231201', 'Amin.bouchiba@gmail.com', '$2y$10$C5dVepJPMLZZTFuQbZu9xeA0mDTPDfzpm95ZJqihfBvoS93Qd/CTC'),
(36, 'jabir', 'mekhloufi', '0719231601', 'jabir.makhloufi@gmail.com', '$2y$10$48aHoSJgGanfRf4MZ5ALB.dRdfTaJ.kDENO2XbdkG3efGYRr2tmxu'),
(37, 'khalil', 'morceli', '0793214206', 'khalil.Morceli@gmail.com', '$2y$10$Ld2d1376XVsC7tYXfqXiyeHaRElhBFvEgijPtpacf41ztEMdZ0w1y'),
(38, 'youcef', 'jabbar', '0670124285', 'youcef.jabbar@gmail.com', '$2y$10$HoSAWvIVqSy/sGVgaPpGruXzCXmXifuPTtnXRzBlBdMc.N2cv2LYG'),
(39, 'najee', 'harbi', '0670523789', 'Najee.harbi@gmail.com', '$2y$10$Mvljgjf.gTjWwjOl0LYHu.a6GpJtBTdI37CTtoRcZq9t9xzt91hgO'),
(40, 'rania', 'mamou', '055555', 'rania.mamou@gmail.com', '$2y$10$JpjztuRmEvGktc6OrFKVD.oQIf3cy2QfhmSXB.LklFfotYwZ63/Qm'),
(42, 'salim', 'harek', '0562178072', 'salim.harek@gmail.com', '$2y$10$aUFa/2CSYxxVJ51IhwKpJuBSn84j5VJzABstgJh2fMRMUn3hR/HAW'),
(43, 'djameel', 'belkasmi', '0521780752', 'djameeel@gmail.com', '$2y$10$hMU0hNl9luAR7fBgA6MKBuwTfHjjGPrVFztvt8cNN0RxmKzMglDJa');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `demande`
--
ALTER TABLE `demande`
  ADD CONSTRAINT `demande_profession_id` FOREIGN KEY (`professionId`) REFERENCES `profession` (`id`),
  ADD CONSTRAINT `demande_user_id` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`);

--
-- Contraintes pour la table `profession`
--
ALTER TABLE `profession`
  ADD CONSTRAINT `user_professions_contrainte` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`);

--
-- Contraintes pour la table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_id_client_contrante` FOREIGN KEY (`idUser`) REFERENCES `user` (`userId`),
  ADD CONSTRAINT `review_id_profession_contraine` FOREIGN KEY (`idProfession`) REFERENCES `profession` (`id`);

--
-- Contraintes pour la table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `user_sessions_foreign_key` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
