-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 20 jan. 2021 à 21:29
-- Version du serveur :  10.4.13-MariaDB
-- Version de PHP : 7.2.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `db_ecommerce`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `USERID` int(11) NOT NULL,
  `U_NAME` varchar(122) NOT NULL,
  `U_USERNAME` varchar(122) NOT NULL,
  `U_PASS` varchar(122) NOT NULL,
  `U_ROLE` varchar(30) NOT NULL,
  `USERIMAGE` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`USERID`, `U_NAME`, `U_USERNAME`, `U_PASS`, `U_ROLE`, `USERIMAGE`) VALUES
(126, 'Janobe Palacios', 'janobe', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Administrator', 'photos/10329236_874204835938922_6636897990257224477_n.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `CATEGID` int(11) NOT NULL,
  `CATEGORIES` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`CATEGID`, `CATEGORIES`) VALUES
(20, 'computers'),
(21, 'smartphones'),
(23, 'printers'),
(24, 'accessories'),
(25, 'cameras'),
(26, 'TVs'),
(27, 'smart watches'),
(28, 'tablets');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `CUSTOMERID` int(11) NOT NULL,
  `FNAME` varchar(30) NOT NULL,
  `LNAME` varchar(30) NOT NULL,
  `CITYADD` text NOT NULL,
  `DBIRTH` date NOT NULL,
  `GENDER` varchar(10) NOT NULL,
  `PHONE` varchar(20) NOT NULL,
  `EMAIL` varchar(40) NOT NULL,
  `ZIPCODE` int(6) NOT NULL,
  `CUSUNAME` varchar(20) NOT NULL,
  `CUSPASS` varchar(90) NOT NULL,
  `CUSPHOTO` varchar(255) NOT NULL,
  `TERMS` tinyint(4) NOT NULL,
  `DATEJOIN` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`CUSTOMERID`, `FNAME`, `LNAME`, `CITYADD`, `DBIRTH`, `GENDER`, `PHONE`, `EMAIL`, `ZIPCODE`, `CUSUNAME`, `CUSPASS`, `CUSPHOTO`, `TERMS`, `DATEJOIN`) VALUES
(10, 'taha', 'chaari', 'sfax', '0000-00-00', 'Male', '51539047', '', 0, 'taha', '596afd7a600563c3c8a5845f6486bbf9d0999956', 'customer_image/120552415_343469200318978_837273095330120245_n.jpg', 1, '2021-01-14'),
(11, 'mariem', 'zouari', 'sfax', '0000-00-00', 'Female', '55132701', 'marouachoura20@gmail.com', 0, 'mariem', '82e19fa12aab7cfc718a002fc82c0f074bf070e7', '', 1, '2021-01-20'),
(12, 'maroua', 'choura', 'sfax1/sfax sidimansour', '0000-00-00', 'Female', '53906707', 'marouachoura20@gmail.com', 0, 'maroua', '82e19fa12aab7cfc718a002fc82c0f074bf070e7', '', 1, '2021-01-20'),
(13, 'taha', 'chaari', 'sfax', '0000-00-00', 'Male', '55132701', 'tahachaari@enis.tn', 0, 'toutou', '82e19fa12aab7cfc718a002fc82c0f074bf070e7', '', 1, '2021-01-20');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `SUMMARYID` int(11) NOT NULL,
  `ORDEREDDATE` datetime NOT NULL,
  `CUSTOMERID` int(11) NOT NULL,
  `ORDEREDNUM` int(11) NOT NULL,
  `PAYMENT` double NOT NULL,
  `PAYMENTMETHOD` varchar(30) NOT NULL,
  `ORDEREDSTATS` varchar(30) NOT NULL,
  `ORDEREDREMARKS` varchar(125) NOT NULL,
  `CLAIMEDADTE` datetime NOT NULL,
  `HVIEW` tinyint(4) NOT NULL,
  `USERID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`SUMMARYID`, `ORDEREDDATE`, `CUSTOMERID`, `ORDEREDNUM`, `PAYMENT`, `PAYMENTMETHOD`, `ORDEREDSTATS`, `ORDEREDREMARKS`, `CLAIMEDADTE`, `HVIEW`, `USERID`) VALUES
(1, '2019-08-21 06:24:24', 9, 93, 0, 'Cash on Delivery', 'Pending', 'Your order is on process.', '0000-00-00 00:00:00', 1, 0),
(3, '2019-08-21 06:27:09', 9, 94, 269, 'Cash on Delivery', 'Confirmed', 'Your order has been confirmed.', '2019-08-21 00:00:00', 1, 0),
(4, '2021-01-14 05:32:50', 10, 95, 289, 'Cash on Delivery', 'Pending', 'Your order is on process.', '0000-00-00 00:00:00', 0, 0),
(5, '2021-01-14 05:33:20', 10, 96, 149, 'Cash on Delivery', 'Pending', 'Your order is on process.', '0000-00-00 00:00:00', 0, 0),
(6, '0000-00-00 00:00:00', 0, 0, 0, '', '', '', '0000-00-00 00:00:00', 0, 0),
(22, '2021-01-20 05:43:29', 12, 98, 1600, 'Cash on Delivery', 'Pending', 'Your order is on process.', '0000-00-00 00:00:00', 1, 0),
(28, '2021-01-20 05:48:08', 12, 99, 8500, 'Cash on Delivery', 'Pending', 'Your order is on process.', '0000-00-00 00:00:00', 0, 0),
(29, '2021-01-20 05:48:32', 12, 100, 1600, 'Cash on Delivery', 'Pending', 'Your order is on process.', '0000-00-00 00:00:00', 0, 0),
(30, '2021-01-20 08:04:50', 13, 101, 6000, 'Cash on Delivery', 'Pending', 'Your order is on process.', '0000-00-00 00:00:00', 0, 0),
(31, '2021-01-20 08:10:06', 13, 102, 2500, 'Cash on Delivery', 'Pending', 'Your order is on process.', '0000-00-00 00:00:00', 0, 0),
(32, '2021-01-20 08:10:28', 13, 103, 12000, 'Cash on Delivery', 'Pending', 'Your order is on process.', '0000-00-00 00:00:00', 1, 0),
(33, '2021-01-20 08:13:17', 13, 104, 6000, 'Cash on Delivery', 'Pending', 'Your order is on process.', '0000-00-00 00:00:00', 0, 0),
(34, '2021-01-20 09:07:54', 13, 105, 1500, 'Cash on Delivery', 'Pending', 'Your order is on process.', '0000-00-00 00:00:00', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `lignecommande`
--

CREATE TABLE `lignecommande` (
  `ORDERID` int(11) NOT NULL,
  `PROID` int(11) NOT NULL,
  `ORDEREDQTY` int(11) NOT NULL,
  `ORDEREDPRICE` double NOT NULL,
  `ORDEREDNUM` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `lignecommande`
--

INSERT INTO `lignecommande` (`ORDERID`, `PROID`, `ORDEREDQTY`, `ORDEREDPRICE`, `ORDEREDNUM`) VALUES
(22, 201771, 1, 1600, 98),
(28, 201773, 1, 8500, 99),
(29, 201771, 1, 1600, 100),
(30, 201772, 1, 6000, 101),
(31, 201761, 1, 2500, 102),
(32, 201772, 2, 12000, 103),
(33, 201772, 1, 6000, 104),
(34, 201759, 1, 1500, 105);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `PROID` int(11) NOT NULL,
  `PRODESC` varchar(255) DEFAULT NULL,
  `PROQTY` int(11) DEFAULT NULL,
  `ORIGINALPRICE` double NOT NULL,
  `PROPRICE` double DEFAULT NULL,
  `CATEGID` int(11) DEFAULT NULL,
  `IMAGES` varchar(255) DEFAULT NULL,
  `PROSTATS` varchar(30) DEFAULT NULL,
  `OWNERNAME` varchar(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`PROID`, `PRODESC`, `PROQTY`, `ORIGINALPRICE`, `PROPRICE`, `CATEGID`, `IMAGES`, `PROSTATS`, `OWNERNAME`) VALUES
(201743, '-Self-lighting OLED: Perfect Black, Intense Color, Infinite Contrast\r\n-a9 Gen 3 AI Processor 4K with AI Picture Pro/Sound Pro\r\n-Dolby Vision IQ and Dolby Atmos\r\n-webOS + ThinQ AI w/ Magic Remote\r\n-Gaming: G-SYNC Compatible, FreeSync, VRR, ALLM', 20, 100000, 200000, 26, 'uploaded_photos/tv1 (2).jpg', 'Available', 'samsung'),
(201744, '-Self-lighting OLED: Perfect Black, Intense Color, Infinite Contrast\r\n-a9 Gen 3 AI Processor 4K with AI Picture Pro/Sound Pro\r\n-Dolby Vision IQ and Dolby Atmos\r\n-webOS + ThinQ AI w/ Magic Remote\r\n-Gaming: G-SYNC Compatible, FreeSync, VRR, ALLM', 30, 2000, 3000, 26, 'uploaded_photos/tv2 (1).jpg', 'Available', 'samsung'),
(201745, '-Self-lighting OLED: Perfect Black, Intense Color, Infinite Contrast\r\n-a9 Gen 3 AI Processor 4K with AI Picture Pro/Sound Pro\r\n-Dolby Vision IQ and Dolby Atmos\r\n-webOS + ThinQ AI w/ Magic Remote\r\n-Gaming: G-SYNC Compatible, FreeSync, VRR, ALLM', 20, 2000, 2300, 26, 'uploaded_photos/tv3.jpg', 'Available', 'TUSHIBA'),
(201746, '-Self-lighting OLED: Perfect Black, Intense Color, Infinite Contrast\r\n-a9 Gen 3 AI Processor 4K with AI Picture Pro/Sound Pro\r\n-Dolby Vision IQ and Dolby Atmos\r\n-webOS + ThinQ AI w/ Magic Remote\r\n-Gaming: G-SYNC Compatible, FreeSync, VRR, ALLM', 20, 1500, 2000, 26, 'uploaded_photos/tv7 (1).jpg', 'Available', 'TUSHIBA'),
(201747, '-Self-lighting OLED: Perfect Black, Intense Color, Infinite Contrast\r\n-a9 Gen 3 AI Processor 4K with AI Picture Pro/Sound Pro\r\n-Dolby Vision IQ and Dolby Atmos\r\n-webOS + ThinQ AI w/ Magic Remote\r\n-Gaming: G-SYNC Compatible, FreeSync, VRR, ALLM', 20, 2000, 2300, 26, 'uploaded_photos/tv5 (1).jpg', 'Available', 'TUSHIBA'),
(201748, '-Self-lighting OLED: Perfect Black, Intense Color, Infinite Contrast\r\n-a9 Gen 3 AI Processor 4K with AI Picture Pro/Sound Pro\r\n-Dolby Vision IQ and Dolby Atmos\r\n-webOS + ThinQ AI w/ Magic Remote\r\n-Gaming: G-SYNC Compatible, FreeSync, VRR, ALLM', 20, 2400, 3000, 26, 'uploaded_photos/tv6 (1).jpg', 'Available', 'samsung'),
(201749, '1. Approximate number of effective pixels.\r\n\r\n2. Compared to the ?7 II. Sony test conditions.\r\n\r\n3. Sony test conditions.\r\n\r\n4. Limited to 12 bits during compressed RAW continuous shooting, BULB exposure, or when Long Exposure NR is ON.\r\n\r\n5. When uncompr', 20, 500, 750, 25, 'uploaded_photos/cam7 (1).jpg', 'Available', 'NIKON'),
(201750, '1. Approximate number of effective pixels.\r\n\r\n2. Compared to the ?7 II. Sony test conditions.\r\n\r\n3. Sony test conditions.\r\n\r\n4. Limited to 12 bits during compressed RAW continuous shooting, BULB exposure, or when Long Exposure NR is ON.\r\n\r\n5. When uncompr', 20, 2000, 2500, 25, 'uploaded_photos/cam2 (2).jpg', 'Available', 'canon'),
(201751, '1. Approximate number of effective pixels.\r\n\r\n2. Compared to the ?7 II. Sony test conditions.\r\n\r\n3. Sony test conditions.\r\n\r\n4. Limited to 12 bits during compressed RAW continuous shooting, BULB exposure, or when Long Exposure NR is ON.\r\n\r\n5. When uncompr', 10, 1500, 2000, 25, 'uploaded_photos/cam3 (1).jpg', 'Available', 'SONY'),
(201752, '1. Approximate number of effective pixels.\r\n\r\n2. Compared to the ?7 II. Sony test conditions.\r\n\r\n3. Sony test conditions.\r\n\r\n4. Limited to 12 bits during compressed RAW continuous shooting, BULB exposure, or when Long Exposure NR is ON.\r\n\r\n5. When uncompr', 20, 1000, 1500, 25, 'uploaded_photos/cam4 (1).jpg', 'Available', 'polaroid'),
(201753, '1. Approximate number of effective pixels.\r\n\r\n2. Compared to the ?7 II. Sony test conditions.\r\n\r\n3. Sony test conditions.\r\n\r\n4. Limited to 12 bits during compressed RAW continuous shooting, BULB exposure, or when Long Exposure NR is ON.\r\n\r\n5. When uncompr', 10, 200, 500, 25, 'uploaded_photos/cam5 (1).jpg', 'Available', 'samsung'),
(201754, '1. Approximate number of effective pixels.\r\n\r\n2. Compared to the ?7 II. Sony test conditions.\r\n\r\n3. Sony test conditions.\r\n\r\n4. Limited to 12 bits during compressed RAW continuous shooting, BULB exposure, or when Long Exposure NR is ON.\r\n\r\n5. When uncompr', 20, 600, 800, 25, 'uploaded_photos/cam6 (1).jpg', 'Available', 'samsung'),
(201758, 'See-through back shows off original design of device. Robust clear bumper provides better grip for comfortable handling. Raised lips protects front display from potential scratches and damage. Attach hand or neck straps with the built-in dual QuikCatch la', 19, 1000, 1200, 21, 'uploaded_photos/pphone10.jpg', 'Available', 'samsung'),
(201759, 'See-through back shows off original design of device. Robust clear bumper provides better grip for comfortable handling. Raised lips protects front display from potential scratches and damage. Attach hand or neck straps with the built-in dual QuikCatch la', 24, 1200, 1500, 21, 'uploaded_photos/phone2.jpg', 'Available', 'samsung'),
(201760, 'See-through back shows off original design of device. Robust clear bumper provides better grip for comfortable handling. Raised lips protects front display from potential scratches and damage. Attach hand or neck straps with the built-in dual QuikCatch la', 10, 2000, 2500, 21, 'uploaded_photos/phone3.jpg', 'Available', 'samsung'),
(201761, 'See-through back shows off original design of device. Robust clear bumper provides better grip for comfortable handling. Raised lips protects front display from potential scratches and damage. Attach hand or neck straps with the built-in dual QuikCatch la', 49, 2000, 2500, 21, 'uploaded_photos/phone8.jpg', 'Available', 'Iphone'),
(201762, 'See-through back shows off original design of device. Robust clear bumper provides better grip for comfortable handling. Raised lips protects front display from potential scratches and damage. Attach hand or neck straps with the built-in dual QuikCatch la', 10, 2500, 3000, 21, 'uploaded_photos/phone7.jpg', 'Available', 'Iphone'),
(201763, 'See-through back shows off original design of device. Robust clear bumper provides better grip for comfortable handling. Raised lips protects front display from potential scratches and damage. Attach hand or neck straps with the built-in dual QuikCatch la', 20, 1200, 1500, 21, 'uploaded_photos/phone9.jpg', 'Available', 'Oppo'),
(201764, 'See-through back shows off original design of device. Robust clear bumper provides better grip for comfortable handling. Raised lips protects front display from potential scratches and damage. Attach hand or neck straps with the built-in dual QuikCatch la', 10, 400, 600, 21, 'uploaded_photos/phone4.jpg', 'Available', 'samsung'),
(201765, 'See-through back shows off original design of device. Robust clear bumper provides better grip for comfortable handling. Raised lips protects front display from potential scratches and damage. Attach hand or neck straps with the built-in dual QuikCatch la', 10, 1500, 1700, 28, 'uploaded_photos/ipad1.jpg', 'Available', 'samsung'),
(201766, 'See-through back shows off original design of device. Robust clear bumper provides better grip for comfortable handling. Raised lips protects front display from potential scratches and damage. Attach hand or neck straps with the built-in dual QuikCatch la', 10, 200, 500, 28, 'uploaded_photos/ipad2.jpg', 'Available', 'TUSHIBA'),
(201767, 'See-through back shows off original design of device. Robust clear bumper provides better grip for comfortable handling. Raised lips protects front display from potential scratches and damage. Attach hand or neck straps with the built-in dual QuikCatch la', 15, 1000, 1200, 28, 'uploaded_photos/ipad3.jpg', 'Available', 'samsung'),
(201768, 'See-through back shows off original design of device. Robust clear bumper provides better grip for comfortable handling. Raised lips protects front display from potential scratches and damage. Attach hand or neck straps with the built-in dual QuikCatch la', 15, 1500, 1700, 28, 'uploaded_photos/ipad4.jpg', 'Available', 'apple'),
(201769, 'See-through back shows off original design of device. Robust clear bumper provides better grip for comfortable handling. Raised lips protects front display from potential scratches and damage. Attach hand or neck straps with the built-in dual QuikCatch la', 70, 1500, 1800, 28, 'uploaded_photos/ipad5.jpg', 'Available', 'Oppo'),
(201770, 'See-through back shows off original design of device. Robust clear bumper provides better grip for comfortable handling. Raised lips protects front display from potential scratches and damage. Attach hand or neck straps with the built-in dual QuikCatch la', 20, 2000, 2300, 28, 'uploaded_photos/ipad6.jpg', 'Available', 'samsung'),
(201771, 'See-through back shows off original design of device. Robust clear bumper provides better grip for comfortable handling. Raised lips protects front display from potential scratches and damage. Attach hand or neck straps with the built-in dual QuikCatch la', 18, 1400, 1600, 20, 'uploaded_photos/pc1.jpg', 'Available', 'apple'),
(201772, 'See-through back shows off original design of device. Robust clear bumper provides better grip for comfortable handling. Raised lips protects front display from potential scratches and damage. Attach hand or neck straps with the built-in dual QuikCatch la', 5, 5000, 6000, 20, 'uploaded_photos/pc2.jpg', 'Available', 'apple'),
(201773, 'See-through back shows off original design of device. Robust clear bumper provides better grip for comfortable handling. Raised lips protects front display from potential scratches and damage. Attach hand or neck straps with the built-in dual QuikCatch la', 8, 8000, 8500, 20, 'uploaded_photos/pc3.jpg', 'Available', 'apple');

-- --------------------------------------------------------

--
-- Structure de la table `promo`
--

CREATE TABLE `promo` (
  `PROMOID` int(11) NOT NULL,
  `PROID` int(11) NOT NULL,
  `PRODISCOUNT` double NOT NULL,
  `PRODISPRICE` double NOT NULL,
  `PROBANNER` tinyint(4) NOT NULL,
  `PRONEW` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `promo`
--

INSERT INTO `promo` (`PROMOID`, `PROID`, `PRODISCOUNT`, `PRODISPRICE`, `PROBANNER`, `PRONEW`) VALUES
(1, 201737, 0, 119, 0, 0),
(2, 201738, 0, 199, 0, 0),
(3, 201739, 0, 289, 0, 0),
(4, 201740, 0, 149, 0, 0),
(5, 201741, 0, 89, 0, 0),
(6, 201742, 0, 287, 0, 0),
(7, 201743, 0, 200000, 0, 0),
(8, 201744, 0, 3000, 0, 0),
(9, 201745, 0, 2300, 0, 0),
(10, 201746, 0, 2000, 0, 0),
(11, 201747, 0, 2300, 0, 0),
(12, 201748, 0, 3000, 0, 0),
(13, 201749, 0, 750, 0, 0),
(14, 201750, 0, 2500, 0, 0),
(15, 201751, 0, 2000, 0, 0),
(16, 201752, 0, 1500, 0, 0),
(17, 201753, 0, 500, 0, 0),
(18, 201754, 0, 800, 0, 0),
(22, 201758, 0, 1200, 0, 0),
(23, 201759, 0, 1500, 0, 0),
(24, 201760, 0, 2500, 0, 0),
(25, 201761, 0, 2500, 0, 0),
(26, 201762, 0, 3000, 0, 0),
(27, 201763, 0, 1500, 0, 0),
(28, 201764, 0, 600, 0, 0),
(29, 201765, 0, 1700, 0, 0),
(30, 201766, 0, 500, 0, 0),
(31, 201767, 0, 1200, 0, 0),
(32, 201768, 0, 1700, 0, 0),
(33, 201769, 0, 1800, 0, 0),
(34, 201770, 0, 2300, 0, 0),
(35, 201771, 0, 1600, 0, 0),
(36, 201772, 0, 6000, 0, 0),
(37, 201773, 0, 8500, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `tblautonumber`
--

CREATE TABLE `tblautonumber` (
  `ID` int(11) NOT NULL,
  `AUTOSTART` varchar(11) NOT NULL,
  `AUTOINC` int(11) NOT NULL,
  `AUTOEND` int(11) NOT NULL,
  `AUTOKEY` varchar(12) NOT NULL,
  `AUTONUM` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `tblautonumber`
--

INSERT INTO `tblautonumber` (`ID`, `AUTOSTART`, `AUTOINC`, `AUTOEND`, `AUTOKEY`, `AUTONUM`) VALUES
(1, '2017', 1, 74, 'PROID', 10),
(2, '0', 1, 106, 'ordernumber', 0);

-- --------------------------------------------------------

--
-- Structure de la table `tblsetting`
--

CREATE TABLE `tblsetting` (
  `SETTINGID` int(11) NOT NULL,
  `PLACE` text NOT NULL,
  `BRGY` varchar(90) NOT NULL,
  `DELPRICE` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `tblsetting`
--

INSERT INTO `tblsetting` (`SETTINGID`, `PLACE`, `BRGY`, `DELPRICE`) VALUES
(1, 'Kabankalan City', 'Brgy. 1', 50),
(2, 'Himamaylan City', 'Brgy. 1', 70),
(3, 'sfax', '', 6);

-- --------------------------------------------------------

--
-- Structure de la table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `CUSID` int(11) NOT NULL,
  `PROID` int(11) NOT NULL,
  `WISHDATE` date NOT NULL,
  `WISHSTATS` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `wishlist`
--

INSERT INTO `wishlist` (`id`, `CUSID`, `PROID`, `WISHDATE`, `WISHSTATS`) VALUES
(2, 9, 201742, '2019-08-21', '0'),
(3, 0, 0, '2021-01-14', '0'),
(4, 10, 201741, '2021-01-15', '0'),
(5, 0, 0, '2021-01-20', '0'),
(6, 0, 0, '2021-01-20', '0'),
(7, 12, 201771, '2021-01-20', '0'),
(8, 0, 0, '2021-01-20', '0'),
(9, 13, 201760, '2021-01-20', '0');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`USERID`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`CATEGID`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`CUSTOMERID`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`SUMMARYID`),
  ADD UNIQUE KEY `ORDEREDNUM` (`ORDEREDNUM`),
  ADD KEY `CUSTOMERID` (`CUSTOMERID`),
  ADD KEY `USERID` (`USERID`);

--
-- Index pour la table `lignecommande`
--
ALTER TABLE `lignecommande`
  ADD PRIMARY KEY (`ORDERID`),
  ADD KEY `PROID` (`PROID`),
  ADD KEY `ORDEREDNUM` (`ORDEREDNUM`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`PROID`),
  ADD KEY `CATEGID` (`CATEGID`);

--
-- Index pour la table `promo`
--
ALTER TABLE `promo`
  ADD PRIMARY KEY (`PROMOID`),
  ADD UNIQUE KEY `PROID` (`PROID`);

--
-- Index pour la table `tblautonumber`
--
ALTER TABLE `tblautonumber`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `tblsetting`
--
ALTER TABLE `tblsetting`
  ADD PRIMARY KEY (`SETTINGID`);

--
-- Index pour la table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `admin`
--
ALTER TABLE `admin`
  MODIFY `USERID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `CATEGID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `CUSTOMERID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `SUMMARYID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT pour la table `lignecommande`
--
ALTER TABLE `lignecommande`
  MODIFY `ORDERID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT pour la table `promo`
--
ALTER TABLE `promo`
  MODIFY `PROMOID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT pour la table `tblautonumber`
--
ALTER TABLE `tblautonumber`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `tblsetting`
--
ALTER TABLE `tblsetting`
  MODIFY `SETTINGID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
