-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : mysql_db
-- Généré le : dim. 24 mars 2024 à 14:38
-- Version du serveur : 8.2.0
-- Version de PHP : 8.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `Sportify`
--

DELIMITER $$
--
-- Procédures
--
CREATE DEFINER=`root`@`%` PROCEDURE `UPDATE_SUCCES` (IN `id_user` INT, IN `num_succes` INT)   BEGIN
    UPDATE SUCCES 
    SET SUCCES_OBTENU = 'TRUE'
    WHERE UTILISATEUR_ID = id_user AND SUCCES_NAME = num_succes;
    INSERT INTO INVENTAIRE (UTILISATEUR_ID, ITEM_ID) VALUES (id_user, num_succes + 30); 
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `CATEGORIE`
--

CREATE TABLE `CATEGORIE` (
  `id` int NOT NULL,
  `categorie` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `EQUIPE`
--

CREATE TABLE `EQUIPE` (
  `id` int NOT NULL,
  `equipe` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `EVENEMENT`
--

CREATE TABLE `EVENEMENT` (
  `EVENEMENT_ID` int NOT NULL,
  `NOM_EVENEMENT` varchar(25) NOT NULL,
  `DATE_EVENEMENT` date NOT NULL,
  `EQUIPE_DOMICILE` varchar(25) NOT NULL,
  `EQUIPE_EXTERIEUR` varchar(25) NOT NULL,
  `COTE_DOMICILE` float NOT NULL,
  `COTE_EXTERIEUR` float NOT NULL,
  `CAT_SPORT` varchar(25) NOT NULL,
  `ACTIVE` int DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `EVENEMENT`
--

INSERT INTO `EVENEMENT` (`EVENEMENT_ID`, `NOM_EVENEMENT`, `DATE_EVENEMENT`, `EQUIPE_DOMICILE`, `EQUIPE_EXTERIEUR`, `COTE_DOMICILE`, `COTE_EXTERIEUR`, `CAT_SPORT`, `ACTIVE`) VALUES
(2, 'LIGUE 1', '2024-01-01', 'OL', 'ASSE', 1.8, 2.2, 'Football', 1),
(3, 'LIGA', '2024-01-31', 'BARCELONA', 'REAL MADRID', 1.8, 2, 'Football', 1),
(4, 'LIGA', '2024-01-30', 'ATLETICO MADRID', 'SEVILLE', 1.5, 2.5, 'Football', 1),
(5, 'PREMIER LEAGUE', '2024-02-06', 'MAN U', 'MAN C', 1.5, 2.5, 'Football', 1),
(6, 'World Cup', '2024-02-05', 'FRANCE', 'AFRIQUE DU SUD', 1.5, 2.5, 'Rugby', 1),
(7, 'US OPEN', '2024-02-01', 'NADAL', 'DJOKOVIC', 1.5, 2.5, 'Tennis', 1),
(8, 'NBA', '2024-01-26', 'LAKERS', 'BULLS', 1.5, 2.5, 'Basketball', 1),
(9, 'IUT', '2024-01-27', 'RAMAZAN', 'RAFIK', 1.5, 2.5, 'Karate', 1);

-- --------------------------------------------------------

--
-- Structure de la table `INVENTAIRE`
--

CREATE TABLE `INVENTAIRE` (
  `INVENTAIRE_ID` int NOT NULL,
  `UTILISATEUR_ID` int NOT NULL,
  `ITEM_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `INVENTAIRE`
--

INSERT INTO `INVENTAIRE` (`INVENTAIRE_ID`, `UTILISATEUR_ID`, `ITEM_ID`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `ITEMS`
--

CREATE TABLE `ITEMS` (
  `ITEM_ID` int NOT NULL,
  `NOM_ITEM` varchar(25) NOT NULL,
  `TYPE` varchar(25) NOT NULL,
  `DESCRIPTION` varchar(256) NOT NULL,
  `PRIX` int NOT NULL,
  `COULEUR` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `ITEMS`
--

INSERT INTO `ITEMS` (`ITEM_ID`, `NOM_ITEM`, `TYPE`, `DESCRIPTION`, `PRIX`, `COULEUR`) VALUES
(1, 'Kimono', 'Icone', 'Kimono de Karaté', 250, 'Blanc'),
(2, 'Baseball couronné', 'Icone', 'Balle de Baseball couronné', 150, 'Blanc'),
(3, 'Crampons', 'Icone', 'Crampons de Foot', 150, 'Bleu'),
(4, 'Casque', 'Icone', 'Casque de Rallye', 200, 'Vert'),
(5, 'Rugby', 'Icone', 'Balle de Rugby', 200, 'Bleu'),
(6, 'Pelé', 'Icone', 'Maillot floqué Pelé', 500, 'Bleu'),
(7, 'Vitesse', 'Icone', 'Balle de Baseball en feu', 150, 'Rouge'),
(8, 'Foot', 'Icone', 'Ballon de Foot', 150, 'Blanc'),
(9, 'Ballons', 'Icone', 'Ballons de sports', 200, 'Orange'),
(10, 'Baseball', 'Icone', 'Balle de Baseball', 150, 'Blanc'),
(11, 'Archer', 'Icone', 'Archer profesionnel', 150, 'Vert'),
(12, 'JudoKa', 'Icone', 'Kimono de Judo', 125, 'Blanc'),
(13, 'Hokey', 'Icone', 'Palet de Hokey', 150, 'Noir'),
(14, 'Champion', 'Badge', 'Badge de champion', 125, 'Violet'),
(15, 'Sergent', 'Badge', 'Badge de sergent', 125, 'Jaune'),
(16, 'Buteur', 'Badge', 'Meilleur buteur', 150, 'Jaune'),
(17, 'Foot rétro', 'Icone', 'Ballon de Foot rétro', 350, 'Marron'),
(18, 'Home Run', 'Badge', 'Record Home Run', 150, 'Gris'),
(19, 'Batte Baseball', 'Badge', 'Batte de Baseball stylé', 125, 'Rouge'),
(20, 'Police', 'Badge', 'Shérif de police', 150, 'Jaune'),
(21, 'JO', 'Badge', 'Logo des Jeux Olympiques', 175, 'Noir'),
(22, 'Médaille', 'Badge', 'Médaille de première place', 225, 'Jaune'),
(23, 'Terrain Basket', 'Badge', 'Terrain de Basketball', 250, 'Marron'),
(24, 'Terrain Foot', 'Badge', 'Terrain de Fottball', 275, 'Vert'),
(25, 'Coupe', 'Badge', 'Coupe vainqueur', 250, 'Jaune'),
(26, 'Real Madrid', 'Ecusson', '14 UCL Winners', 500, 'Blanc'),
(27, 'Barcelone', 'Ecusson', 'Nothing Winners', 500, 'Bleu'),
(31, 'Succes', 'Icone', 'null', 0, 'null'),
(32, 'Succes', 'Icone', 'null', 0, 'null'),
(33, 'Succes', 'Icone', 'null', 0, 'null'),
(34, 'Succes', 'Icone', 'null', 0, 'null'),
(35, 'Succes', 'Icone', 'null', 0, 'null'),
(36, 'Succes', 'Icone', 'null', 0, 'null'),
(37, 'Succes', 'Icone', 'null', 0, 'null'),
(38, 'Succes', 'Icone', 'null', 0, 'null'),
(39, 'Succes', 'Icone', 'null', 0, 'null'),
(40, 'Succes', 'Icone', 'null', 0, 'null'),
(41, 'Succes', 'Icone', 'null', 0, 'null'),
(42, 'Succes', 'Icone', 'null', 0, 'null'),
(43, 'Succes', 'Icone', 'null', 0, 'null'),
(44, 'Succes', 'Icone', 'null', 0, 'null'),
(45, 'Succes', 'Icone', 'null', 0, 'null'),
(46, 'Succes', 'Icone', 'null', 0, 'null'),
(47, 'Succes', 'Icone', 'null', 0, 'null'),
(48, 'Succes', 'Icone', 'null', 0, 'null'),
(49, 'Succes', 'Icone', 'null', 0, 'null'),
(50, 'Succes', 'Icone', 'null', 0, 'null'),
(51, 'Succes', 'Icone', 'null', 0, 'null'),
(52, 'Succes', 'Icone', 'null', 0, 'null'),
(53, 'Succes', 'Icone', 'null', 0, 'null'),
(54, 'Succes', 'Icone', 'null', 0, 'null'),
(55, 'Succes', 'Icone', 'null', 0, 'null'),
(56, 'Succes', 'Icone', 'null', 0, 'null'),
(57, 'Succes', 'Icone', 'null', 0, 'null'),
(58, 'Succes', 'Icone', 'null', 0, 'null'),
(59, 'Succes', 'Icone', 'null', 0, 'null'),
(60, 'Succes', 'Icone', 'null', 0, 'null');

-- --------------------------------------------------------

--
-- Structure de la table `JEU_USER`
--

CREATE TABLE `JEU_USER` (
  `UTILISATEUR_ID` int NOT NULL,
  `NB_LOSE` int DEFAULT '0',
  `NB_kILL` int DEFAULT '0',
  `NB_BEKILL` int DEFAULT '0',
  `SCORE_CLASSEMENT` int DEFAULT '0',
  `NB_JET` int DEFAULT '0',
  `NB_PIECE` int DEFAULT '0',
  `NB_PARTIE_FOOT` int DEFAULT '0',
  `NB_PARTIE_BASKET` int DEFAULT '0',
  `NB_PARTIE_TENNIS` int DEFAULT '0',
  `NB_PARTIE_BASEBALL` int DEFAULT '0',
  `NB_PARTIE_RUGBY` int DEFAULT '0',
  `NB_PARTIE_BOWLING` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déclencheurs `JEU_USER`
--
DELIMITER $$
CREATE TRIGGER `trig_update_succes` AFTER UPDATE ON `JEU_USER` FOR EACH ROW BEGIN
    -- Variable pour le meilleur score
    DECLARE maxScore INT DEFAULT 0;
    -- Variable pour le 10e meilleur score
    DECLARE DIXESCORE INT DEFAULT 0;  
    -- Variable pour le nombre de succès obtenus
    DECLARE nbSucces INT DEFAULT 0;

    -- SUCCES SUR LE NOMBRE DE PARTIE PERDU;
    IF NEW.NB_LOSE != OLD.NB_LOSE THEN
        IF NEW.NB_LOSE >= 10 THEN 
            CALL UPDATE_SUCCES(NEW.UTILISATEUR_ID, 1);
        END IF;
        IF NEW.NB_LOSE >= 15 THEN
            CALL UPDATE_SUCCES(NEW.UTILISATEUR_ID, 2);
        END IF;
        IF NEW.NB_LOSE >= 30 THEN
            CALL UPDATE_SUCCES(NEW.UTILISATEUR_ID, 3);
        END IF;
    END IF;

    -- SUCCES SUR LE NOMBRE DE MONSTRES TUES;
    IF NEW.NB_KILL != OLD.NB_KILL THEN
        IF NEW.NB_KILL >= 40 THEN
            CALL UPDATE_SUCCES(NEW.UTILISATEUR_ID, 8);
        END IF;
    END IF;

    -- SUCCES SUR DE MORT;
    IF NEW.NB_BEKILL != OLD.NB_BEKILL THEN
        IF NEW.NB_BEKILL >= 5 THEN
            CALL UPDATE_SUCCES(NEW.UTILISATEUR_ID, 9);
        END IF; 
        IF NEW.NB_BEKILL >= 15 THEN
            CALL UPDATE_SUCCES(NEW.UTILISATEUR_ID, 10);
        END IF;
    END IF;

    -- SUCCES SUR LE MEILLEUR SCORE;
    IF NEW.SCORE_CLASSEMENT != OLD.SCORE_CLASSEMENT THEN
        SELECT MAX(SCORE_CLASSEMENT) INTO maxScore FROM UTILISATEUR;
        IF NEW.SCORE_CLASSEMENT = maxScore THEN
            CALL UPDATE_SUCCES(NEW.UTILISATEUR_ID, 13);
        END IF;

        -- SUCCES SUR LE TOP 10;
        SELECT SCORE_CLASSEMENT INTO DIXESCORE FROM 
            (SELECT SCORE_CLASSEMENT FROM UTILISATEUR ORDER BY SCORE_CLASSEMENT DESC LIMIT 9, 1) AS temp;
        IF NEW.SCORE_CLASSEMENT >= DIXESCORE THEN
            CALL UPDATE_SUCCES(NEW.UTILISATEUR_ID, 29);
        END IF;
    END IF;

    -- SUCCES SUR LE NOMBRE DE PIECE OBTENU;
    IF NEW.NB_PIECE != OLD.NB_PIECE THEN
        IF NEW.NB_PIECE >= 300 THEN
            CALL UPDATE_SUCCES(NEW.UTILISATEUR_ID, 18);
        END IF;
    END IF;

    -- SUCCES SUR LE NOMBRE DE JET OBTENU;
    IF NEW.NB_JET != OLD.NB_JET THEN
        IF NEW.NB_JET >= 20 THEN
            CALL UPDATE_SUCCES(NEW.UTILISATEUR_ID, 20);
        END IF;
    END IF;
    
    IF NEW.NB_PARTIE_FOOT >= 1 AND NEW.NB_PARTIE_BASKET >= 1 AND
       NEW.NB_PARTIE_TENNIS >= 1 AND NEW.NB_PARTIE_BASEBALL >= 1 AND
       NEW.NB_PARTIE_RUGBY >= 1 AND NEW.NB_PARTIE_BOWLING >= 1 THEN
        CALL UPDATE_SUCCES(NEW.UTILISATEUR_ID, 22);
    END IF;
    
    IF NEW.NB_PARTIE_FOOT >= 15 OR NEW.NB_PARTIE_BASKET >= 15 OR
       NEW.NB_PARTIE_TENNIS >= 15 OR NEW.NB_PARTIE_BASEBALL >= 15 OR
       NEW.NB_PARTIE_RUGBY >= 15 OR NEW.NB_PARTIE_BOWLING >= 15 THEN
        CALL UPDATE_SUCCES(NEW.UTILISATEUR_ID, 23);
    END IF;
    
    -- SUCCES SUR L'OBTENTION DE TOUS LES SUCCES;
    SELECT COUNT(SUCCES_ID) INTO nbSucces FROM SUCCES WHERE UTILISATEUR_ID = NEW.UTILISATEUR_ID AND SUCCES_OBTENU = 'TRUE';
    IF nbSucces = 27 THEN
        CALL UPDATE_SUCCES(NEW.UTILISATEUR_ID, 30);
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `LIKES`
--

CREATE TABLE `LIKES` (
  `POST_ID` int NOT NULL,
  `UTILISATEUR_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `LIKES`
--

INSERT INTO `LIKES` (`POST_ID`, `UTILISATEUR_ID`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `POST`
--

CREATE TABLE `POST` (
  `POST_ID` int NOT NULL,
  `AUTEUR_ID` int NOT NULL,
  `AUTEUR_NOM` varchar(50) NOT NULL,
  `NOM_TOPIC` varchar(25) NOT NULL,
  `DESCRIPTION_POST` varchar(255) DEFAULT ' ',
  `NB_LIKE` int DEFAULT '0',
  `PARENT_POST` int DEFAULT '0',
  `NB_COM` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `POST`
--

INSERT INTO `POST` (`POST_ID`, `AUTEUR_ID`, `AUTEUR_NOM`, `NOM_TOPIC`, `DESCRIPTION_POST`, `NB_LIKE`, `PARENT_POST`, `NB_COM`) VALUES
(1, 1, 'admin', 'Transfert', 'Le jeune joueur du FC Barcelone Ansu Fati actuellement prêté à Brighton est sur le point d\'être transféré définitivement pour un montant total de 70M et pour une période de 3 ans', 4, 0, 3),
(2, 4, 'RafikLaTrikDu69', 'CAN', 'C\'est maintenant officiel, l\'Équipe nationale du Maroc se qualifie pour les 8èmes de finale de la compétition', 5, 0, 0),
(3, 3, 'Keap', 'Serie A', 'Le portier Français Mike Maignan a subi des chants racistes lors du match face à Udinese', 8, 0, 0),
(4, 2, 'Rameray', 'NBA', 'La déclaration forte de Wemby : « J’aime être challengé, menacé, et même envoyé en G-League si je ne suis pas bon. J’aime que mes erreurs entraînent des conséquences. »', 6, 0, 0),
(5, 4, 'RafikLaTrikDu69', 'Open d\'Australie', 'MOLTO BENE  Jannik Sinner élimine le demi-finaliste 2023, Karen Khachanov, et se qualifie en 1/4 de finale de l\'Open d\'Australie sans perdre un set.', 9, 0, 1),
(6, 10, 'ChocoPops', 'Premier League', ' LIVERPOOL ENCHAINE ET S\'IMPOSE 4 BUTS A 0 FACE A BOURNEMOUTH ! Les Reds sont LEADERS et prennent provisoirement 5 POINTS D\'AVANCE sur Manchester City. Très très gros match de Diogo Jota impliqué dans les trois buts de Liverpool cet après-midi : 2 buts', 4, 0, 0),
(12, 3, 'Keap', 'Super transfert', 'Cool comme transfert', 3, 1, 0),
(13, 10, 'ChocoPops', 'Transfert', 'ACCORD DE PRINCIPE entre le Real Madrid et les représentants de Kylian Mbappé.  Mais avant de tout valider définitivement, Kylian Mbappé veut entendre les arguments du PSG.', 5, 0, 0),
(14, 12, 'Lyollzz', 'Opportunité', 'C\'est pas mal comme transfert j\'espère qu\'il va réussir . La PL est un bon championnat qui pourrait lui permettre de s\'exprimer.', 6, 1, 0),
(15, 1, 'admin', 'Coupe de France', 'LE STADE RENNAIS ÉLIMINE MARSEILLE ET IRA DÉFIER SOCHAUX EN HUITIÈMES DE FINALE !', 8, 0, 1),
(16, 12, 'Lyollzz', 'Pitoresque', 'C\'est bien fait il n\'y a que 1 seul olympique', 3, 15, 0),
(18, 11, 'Lufty', 'Incroyable', 'Je le suivrais personnellement il a un sacré potentiel dommage qu\'une blessure soit venu tout gaché ...', 4, 1, 0),
(19, 1, 'admin', 'Crack', 'Jannik Sinner est le meilleur tenisman italien je pense que la rivalité avec Carlos Alcaraz sera a suivre durant les prochaine année', 8, 5, 0);

-- --------------------------------------------------------

--
-- Structure de la table `PRONOSTIC`
--

CREATE TABLE `PRONOSTIC` (
  `PRONOSTIC_ID` int NOT NULL,
  `PRONOSTIQUEUR_ID` int NOT NULL,
  `MATCH_PRONO` int NOT NULL,
  `COTE_PRONO` decimal(10,1) NOT NULL,
  `DATE_PRONO` date NOT NULL,
  `MISE` int DEFAULT '0',
  `STATUS` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `PRONOSTIC`
--

INSERT INTO `PRONOSTIC` (`PRONOSTIC_ID`, `PRONOSTIQUEUR_ID`, `MATCH_PRONO`, `COTE_PRONO`, `DATE_PRONO`, `MISE`, `STATUS`) VALUES
(1, 1, 4, 1.5, '2023-11-24', 200, 0),
(2, 1, 2, 1.8, '2023-11-24', 9000, 0);

-- --------------------------------------------------------

--
-- Structure de la table `SUCCES`
--

CREATE TABLE `SUCCES` (
  `SUCCES_ID` int NOT NULL,
  `UTILISATEUR_ID` int NOT NULL,
  `SUCCES_NAME` int NOT NULL,
  `SUCCES_OBTENU` varchar(5) DEFAULT 'FALSE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `UTILISATEUR`
--

CREATE TABLE `UTILISATEUR` (
  `UTILISATEUR_ID` int NOT NULL,
  `PSEUDO` varchar(50) NOT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `MOT_DE_PASSE` varchar(150) NOT NULL,
  `POINT_ACTUEL` decimal(10,2) DEFAULT '0.00',
  `POINT_CLASSEMENT` int DEFAULT '0',
  `STATUS` int DEFAULT '0',
  `SCORE_JEU` int DEFAULT '0',
  `SCORE_CLASSEMENT` int DEFAULT '0',
  `LAST_CONNECTION` date DEFAULT NULL,
  `PDP_SRC` varchar(100) DEFAULT 'http://localhost/public/images/utilisateur.png',
  `BADGE_SRC` varchar(100) DEFAULT 'http://localhost/public/images/badge.png',
  `ECUSSON_SRC` varchar(100) DEFAULT 'http://localhost/public/images/bouclier.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déclencheurs `UTILISATEUR`
--
DELIMITER $$
CREATE TRIGGER `trig_add_succes` AFTER INSERT ON `UTILISATEUR` FOR EACH ROW BEGIN
    DECLARE id_max INT;
    DECLARE v_count INT;
    DECLARE x INT; 
    
    SET x = 1; 
    SELECT COUNT(SUCCES_ID) INTO v_count FROM SUCCES;
    
    IF v_count < 1 THEN
        SET id_max = 0;
    ELSE
        SELECT MAX(SUCCES_ID) INTO id_max FROM SUCCES;
    END IF;
    
    WHILE x <= 30 DO
        INSERT INTO SUCCES (SUCCES_ID, UTILISATEUR_ID, SUCCES_NAME) VALUES (id_max+x, NEW.UTILISATEUR_ID, x);
        SET x = x + 1;
    END WHILE;
    INSERT INTO JEU_USER (UTILISATEUR_ID) VALUES (NEW.UTILISATEUR_ID); 
END
$$
DELIMITER ;

--
-- Déchargement des données de la table `UTILISATEUR`
--

INSERT INTO `UTILISATEUR` (`UTILISATEUR_ID`, `PSEUDO`, `EMAIL`, `MOT_DE_PASSE`, `POINT_ACTUEL`, `POINT_CLASSEMENT`, `STATUS`, `SCORE_JEU`, `LAST_CONNECTION`) VALUES
(1, 'admin', 'admin@admin.fr', '$2y$10$Oz1T4KvH6JaDhLg/iKWu5eVt/eEgH17srKnvYPhsJ9vU3z6AjpoFi', 780.00, 10000, 0, 0, '2024-01-02'),
(2, 'Rameray', 'Rameray@example.com', '$2y$10$Oz1T4KvH6JaDhLg/iKWu5eVt/eEgH17srKnvYPhsJ9vU3z6AjpoFi', 100.00, 0, 1, 0, NULL),
(3, 'Keap', 'Keap@example.com', '$2y$10$Oz1T4KvH6JaDhLg/iKWu5eVt/eEgH17srKnvYPhsJ9vU3z6AjpoFi', 100.00, 0, 1, 0, NULL),
(4, 'RafikLaTrikDu69', 'RafikLaTrikDu69@example.com', '$2y$10$Oz1T4KvH6JaDhLg/iKWu5eVt/eEgH17srKnvYPhsJ9vU3z6AjpoFi', 100.00, 0, 1, 0, NULL);


-- REMPLISSAGE DE DONNEE POUR LE CLASSEMENT DU JEU; 
INSERT INTO `UTILISATEUR` (`UTILISATEUR_ID`, `PSEUDO`, `EMAIL`, `MOT_DE_PASSE`,`POINT_ACTUEL`, `POINT_CLASSEMENT`, `STATUS`, `SCORE_JEU`, `SCORE_CLASSEMENT`, `LAST_CONNECTION`) VALUES
(10, 'ChocoPops', 'rahmaninahil@gmail.com', '$2y$10$odqFW26H02RlEP/0Ba7zJOak3zwEW2JPQm49jeFJGz9Wdz09ZQVtq', 1123.00, 500, 1, 0, 427600, null), 
(11, 'Lufty', 'lufty@gmail.com', '$2y$10$odqFW26H02RlEP/0Ba7zJOak3zwEW2JPQm49jeFJGz9Wdz09ZQVtq', 987.00, 670, 1, 0, 294000, null), 
(12, 'Lyollzz', 'leo@gmail.com', '$2y$10$odqFW26H02RlEP/0Ba7zJOak3zwEW2JPQm49jeFJGz9Wdz09ZQVtq', 843.00, 900, 1, 0, 134820, null),
(13, 'LoîsKassis', 'lois@gmail.com', '$2y$10$odqFW26H02RlEP/0Ba7zJOak3zwEW2JPQm49jeFJGz9Wdz09ZQVtq', 620.00, 300, 1, 0, 102027, null), 
(14, 'Pelilikian', 'pelikan@gmail.com', '$2y$10$odqFW26H02RlEP/0Ba7zJOak3zwEW2JPQm49jeFJGz9Wdz09ZQVtq', 340.00, 456, 1, 0, 95760, null), 
(15, 'Mass$$', 'mass@gmail.com', '$2y$10$odqFW26H02RlEP/0Ba7zJOak3zwEW2JPQm49jeFJGz9Wdz09ZQVtq', 170.00, 890, 1, 0, 77490, null), 
(16, 'Shuuss', 'shuus@gmail.com', '$2y$10$odqFW26H02RlEP/0Ba7zJOak3zwEW2JPQm49jeFJGz9Wdz09ZQVtq', 80.00, 230, 1, 0, 16380, null), 
(17, 'AbuTotem', 'Abu@gmail.com', '$2y$10$odqFW26H02RlEP/0Ba7zJOak3zwEW2JPQm49jeFJGz9Wdz09ZQVtq', 50.00, 6000, 1, 0, 13440, null), 
(18, 'Slovenisl', 'nils@gmail.com', '$2y$10$odqFW26H02RlEP/0Ba7zJOak3zwEW2JPQm49jeFJGz9Wdz09ZQVtq', 35.00, 120, 1, 0, 10500, null), 
(19, 'Muhadinibishi', 'mumu@gmail.com', '$2y$10$odqFW26H02RlEP/0Ba7zJOak3zwEW2JPQm49jeFJGz9Wdz09ZQVtq', 10.00, 1150, 1, 0, 2100, null); 

-- changer la photo de profil de quelque utilisateur
-- UPDATE `UTILISATEUR` SET `PDP_SRC` = 'http://localhost/public/images/Icone1.png' WHERE `UTILISATEUR`.`UTILISATEUR_ID` = 1;
-- UPDATE `UTILISATEUR` SET `PDP_SRC` = 'http://localhost/public/images/Icone2.png' WHERE `UTILISATEUR`.`UTILISATEUR_ID` = 2;
-- UPDATE `UTILISATEUR` SET `PDP_SRC` = 'http://localhost/public/images/Icone3.png' WHERE `UTILISATEUR`.`UTILISATEUR_ID` = 3;
-- UPDATE `UTILISATEUR` SET `PDP_SRC` = 'http://localhost/public/images/Icone4.png' WHERE `UTILISATEUR`.`UTILISATEUR_ID` = 4;
-- UPDATE `UTILISATEUR` SET `PDP_SRC` = 'http://localhost/public/images/Icone5.png' WHERE `UTILISATEUR`.`UTILISATEUR_ID` = 10;
-- UPDATE `UTILISATEUR` SET `PDP_SRC` = 'http://localhost/public/images/Icone6.png' WHERE `UTILISATEUR`.`UTILISATEUR_ID` = 11;
-- UPDATE `UTILISATEUR` SET `PDP_SRC` = 'http://localhost/public/images/Icone7.png' WHERE `UTILISATEUR`.`UTILISATEUR_ID` = 12;


--
-- Index pour les tables déchargées
--

--
-- Index pour la table `CATEGORIE`
--
ALTER TABLE `CATEGORIE`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `EQUIPE`
--
ALTER TABLE `EQUIPE`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `EVENEMENT`
--
ALTER TABLE `EVENEMENT`
  ADD PRIMARY KEY (`EVENEMENT_ID`);

--
-- Index pour la table `INVENTAIRE`
--
ALTER TABLE `INVENTAIRE`
  ADD PRIMARY KEY (`INVENTAIRE_ID`),
  ADD UNIQUE KEY `UTILISATEUR_ID` (`UTILISATEUR_ID`,`ITEM_ID`),
  ADD KEY `FK_ITEM_ID` (`ITEM_ID`);

--
-- Index pour la table `ITEMS`
--
ALTER TABLE `ITEMS`
  ADD PRIMARY KEY (`ITEM_ID`);

--
-- Index pour la table `JEU_USER`
--
ALTER TABLE `JEU_USER`
  ADD KEY `FK_JEU_USER` (`UTILISATEUR_ID`);

--
-- Index pour la table `LIKES`
--
ALTER TABLE `LIKES`
  ADD PRIMARY KEY (`POST_ID`,`UTILISATEUR_ID`),
  ADD KEY `FK_POST_ID_LIKES` (`POST_ID`),
  ADD KEY `FK_UTILISATEUR_ID_LIKES` (`UTILISATEUR_ID`);

--
-- Index pour la table `POST`
--
ALTER TABLE `POST`
  ADD PRIMARY KEY (`POST_ID`),
  ADD KEY `FK_AUTEUR_ID` (`AUTEUR_ID`);

--
-- Index pour la table `PRONOSTIC`
--
ALTER TABLE `PRONOSTIC`
  ADD PRIMARY KEY (`PRONOSTIC_ID`),
  ADD KEY `FK_PRONOSTIQUEUR_ID` (`PRONOSTIQUEUR_ID`),
  ADD KEY `FK_MATCH_PRONO` (`MATCH_PRONO`);

--
-- Index pour la table `SUCCES`
--
ALTER TABLE `SUCCES`
  ADD PRIMARY KEY (`SUCCES_ID`),
  ADD KEY `FK_SUCCES` (`UTILISATEUR_ID`);

--
-- Index pour la table `UTILISATEUR`
--
ALTER TABLE `UTILISATEUR`
  ADD PRIMARY KEY (`UTILISATEUR_ID`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `CATEGORIE`
--
ALTER TABLE `CATEGORIE`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `EQUIPE`
--
ALTER TABLE `EQUIPE`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `EVENEMENT`
--
ALTER TABLE `EVENEMENT`
  MODIFY `EVENEMENT_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `INVENTAIRE`
--
ALTER TABLE `INVENTAIRE`
  MODIFY `INVENTAIRE_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `ITEMS`
--
ALTER TABLE `ITEMS`
  MODIFY `ITEM_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT pour la table `POST`
--
ALTER TABLE `POST`
  MODIFY `POST_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `PRONOSTIC`
--
ALTER TABLE `PRONOSTIC`
  MODIFY `PRONOSTIC_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `UTILISATEUR`
--
ALTER TABLE `UTILISATEUR`
  MODIFY `UTILISATEUR_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `INVENTAIRE`
--
ALTER TABLE `INVENTAIRE`
  ADD CONSTRAINT `FK_ITEM_ID` FOREIGN KEY (`ITEM_ID`) REFERENCES `ITEMS` (`ITEM_ID`),
  ADD CONSTRAINT `FK_USER_ID_INVENTAIRE` FOREIGN KEY (`UTILISATEUR_ID`) REFERENCES `UTILISATEUR` (`UTILISATEUR_ID`),
  ADD CONSTRAINT `FK_UTILISATEUR_ID` FOREIGN KEY (`UTILISATEUR_ID`) REFERENCES `UTILISATEUR` (`UTILISATEUR_ID`);

--
-- Contraintes pour la table `JEU_USER`
--
ALTER TABLE `JEU_USER`
  ADD CONSTRAINT `FK_JEU_USER` FOREIGN KEY (`UTILISATEUR_ID`) REFERENCES `UTILISATEUR` (`UTILISATEUR_ID`);

--
-- Contraintes pour la table `LIKES`
--
ALTER TABLE `LIKES`
  ADD CONSTRAINT `FK_POST_ID_LIKES` FOREIGN KEY (`POST_ID`) REFERENCES `POST` (`POST_ID`);

--
-- Contraintes pour la table `POST`
--
ALTER TABLE `POST`
  ADD CONSTRAINT `FK_AUTEUR_ID` FOREIGN KEY (`AUTEUR_ID`) REFERENCES `UTILISATEUR` (`UTILISATEUR_ID`);

--
-- Contraintes pour la table `PRONOSTIC`
--
ALTER TABLE `PRONOSTIC`
  ADD CONSTRAINT `FK_MATCH_PRONO` FOREIGN KEY (`MATCH_PRONO`) REFERENCES `EVENEMENT` (`EVENEMENT_ID`),
  ADD CONSTRAINT `FK_PRONOSTIQUEUR_ID` FOREIGN KEY (`PRONOSTIQUEUR_ID`) REFERENCES `UTILISATEUR` (`UTILISATEUR_ID`);

--
-- Contraintes pour la table `SUCCES`
--
ALTER TABLE `SUCCES`
  ADD CONSTRAINT `FK_SUCCES` FOREIGN KEY (`UTILISATEUR_ID`) REFERENCES `UTILISATEUR` (`UTILISATEUR_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
