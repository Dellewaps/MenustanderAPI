-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.7.24 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for menustander
CREATE DATABASE IF NOT EXISTS `menustander` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `menustander`;

-- Dumping structure for table menustander.dailies
CREATE TABLE IF NOT EXISTS `dailies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sideone` int(11) DEFAULT NULL,
  `sidetwo` int(11) DEFAULT NULL,
  `sidethree` int(11) DEFAULT NULL,
  `sidefour` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sideoneFK` (`sideone`),
  KEY `sidetwoFK` (`sidetwo`),
  KEY `sidethreeFK` (`sidethree`),
  KEY `sidefourFK` (`sidefour`),
  CONSTRAINT `sidefourFK` FOREIGN KEY (`sidefour`) REFERENCES `side_dishes` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `sideoneFK` FOREIGN KEY (`sideone`) REFERENCES `side_dishes` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `sidethreeFK` FOREIGN KEY (`sidethree`) REFERENCES `side_dishes` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `sidetwoFK` FOREIGN KEY (`sidetwo`) REFERENCES `side_dishes` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table menustander.dailies: ~2 rows (approximately)
DELETE FROM `dailies`;
/*!40000 ALTER TABLE `dailies` DISABLE KEYS */;
INSERT INTO `dailies` (`id`, `description`, `sideone`, `sidetwo`, `sidethree`, `sidefour`) VALUES
	(1, 'kartoffler, rødbeder og persillesovs', 2, 3, 4, 1),
	(2, 'med ris', 2, 4, 5, 1);
/*!40000 ALTER TABLE `dailies` ENABLE KEYS */;

-- Dumping structure for table menustander.dishes
CREATE TABLE IF NOT EXISTS `dishes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `accessories` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table menustander.dishes: ~6 rows (approximately)
DELETE FROM `dishes`;
/*!40000 ALTER TABLE `dishes` DISABLE KEYS */;
INSERT INTO `dishes` (`id`, `name`, `accessories`, `price`, `photo`) VALUES
	(1, 'ingen ret', 'ingen ret', 0, 'lukket.jpg'),
	(2, 'Stegt flæsk', 'kartoffler, rødbeder og persillesovs', 25, '_1557387950.jpg'),
	(3, 'Frikadeller', 'kartoffler, rødkålog brun sovs', 20, '_1557388004.jpg'),
	(4, 'ribbensandwich', 'rødkål og syltede agurker', 25, '_1557388041.jpg'),
	(5, 'Mørbradgryde', 'med ris', 20, '_1557388062.jpg'),
	(6, 'Kyllingelår', 'Tomatsovs', 20, '2732_630x315.jpg');
/*!40000 ALTER TABLE `dishes` ENABLE KEYS */;

-- Dumping structure for table menustander.kantine
CREATE TABLE IF NOT EXISTS `kantine` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Status` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table menustander.kantine: ~1 rows (approximately)
DELETE FROM `kantine`;
/*!40000 ALTER TABLE `kantine` DISABLE KEYS */;
INSERT INTO `kantine` (`Id`, `Status`) VALUES
	(1, 2);
/*!40000 ALTER TABLE `kantine` ENABLE KEYS */;

-- Dumping structure for table menustander.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table menustander.migrations: ~6 rows (approximately)
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(12, '2014_10_12_000000_create_users_table', 1),
	(13, '2014_10_12_100000_create_password_resets_table', 1),
	(14, '2019_04_09_101729_create_dishes_table', 1),
	(15, '2019_04_09_105358_create_side_dishes_table', 1),
	(16, '2019_05_06_075043_create_weekmenu_table', 1),
	(17, '2019_05_08_063234_create_dailies_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table menustander.opentimes
CREATE TABLE IF NOT EXISTS `opentimes` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `open` time NOT NULL,
  `closed` time NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table menustander.opentimes: ~4 rows (approximately)
DELETE FROM `opentimes`;
/*!40000 ALTER TABLE `opentimes` DISABLE KEYS */;
INSERT INTO `opentimes` (`Id`, `open`, `closed`) VALUES
	(1, '08:00:00', '08:30:00'),
	(2, '09:00:00', '10:15:00'),
	(3, '11:30:00', '11:35:00'),
	(4, '13:30:00', '14:00:00');
/*!40000 ALTER TABLE `opentimes` ENABLE KEYS */;

-- Dumping structure for table menustander.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table menustander.password_resets: ~0 rows (approximately)
DELETE FROM `password_resets`;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table menustander.side_dishes
CREATE TABLE IF NOT EXISTS `side_dishes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table menustander.side_dishes: ~5 rows (approximately)
DELETE FROM `side_dishes`;
/*!40000 ALTER TABLE `side_dishes` DISABLE KEYS */;
INSERT INTO `side_dishes` (`id`, `name`, `description`) VALUES
	(1, 'Ingen', 'Ingen'),
	(2, 'Sandwich', 'med rostbeef'),
	(3, 'sandwich', 'Tun'),
	(4, 'sandwich', 'pulledpork'),
	(5, 'Sandwich', 'kylling og bacon');
/*!40000 ALTER TABLE `side_dishes` ENABLE KEYS */;

-- Dumping structure for procedure menustander.sp_daily
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_daily`()
BEGIN
select * from side_dishes d where d.id = (select sideone from dailies ORDER BY dailies.id desc limit 1)
UNION ALL
select * from side_dishes d where d.id = (select sidetwo from dailies ORDER BY dailies.id desc limit 1)
UNION ALL
select * from side_dishes d where d.id = (select sidethree from dailies ORDER BY dailies.id desc limit 1)
UNION ALL
select * from side_dishes d where d.id = (select sidefour from dailies ORDER BY dailies.id desc limit 1)
;
END//
DELIMITER ;

-- Dumping structure for procedure menustander.sp_weekdays
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_weekdays`()
BEGIN
SET @mon = (select monday from weekmenus ORDER BY weekmenus.id desc limit 1);
SET @tue = (select tuesday from weekmenus ORDER BY weekmenus.id desc limit 1);
SET @wed = (select wednesday from weekmenus ORDER BY weekmenus.id desc limit 1);
SET @thu = (select thursday from weekmenus ORDER BY weekmenus.id desc limit 1);
SET @fri = (select friday from weekmenus ORDER BY weekmenus.id desc limit 1);

select * from dishes d where d.id = (select monday from weekmenus ORDER BY weekmenus.id desc limit 1)
UNION ALL
select * from dishes d where d.id = (select tuesday from weekmenus ORDER BY weekmenus.id desc limit 1)
UNION ALL
select * from dishes d where d.id = (select wednesday from weekmenus ORDER BY weekmenus.id desc limit 1)
UNION ALL
select * from dishes d where d.id = (select thursday from weekmenus ORDER BY weekmenus.id desc limit 1)
UNION ALL
select * from dishes d where d.id = (select friday from weekmenus ORDER BY weekmenus.id desc limit 1)
;
END//
DELIMITER ;

-- Dumping structure for table menustander.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table menustander.users: ~0 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `password`) VALUES
	(3, 'test', '$2y$10$lVrPXrOo.g/Om1Os2CicteoLoxaClbgTYVeWsq5Wfm/nHsUD6cWCi');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table menustander.weekmenus
CREATE TABLE IF NOT EXISTS `weekmenus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `monday` int(11) NOT NULL,
  `tuesday` int(11) NOT NULL,
  `wednesday` int(11) NOT NULL,
  `thursday` int(11) NOT NULL,
  `friday` int(11) NOT NULL,
  `mondaycheck` int(11) NOT NULL DEFAULT '1',
  `tuesdaycheck` int(11) NOT NULL DEFAULT '1',
  `wednesdaycheck` int(11) NOT NULL DEFAULT '1',
  `thursdaycheck` int(11) NOT NULL DEFAULT '1',
  `fridaycheck` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mondayFK` (`monday`),
  KEY `tuesdayFK` (`tuesday`),
  KEY `wednesdayFK` (`wednesday`),
  KEY `thursdayFK` (`thursday`),
  KEY `fridayFK` (`friday`),
  CONSTRAINT `fridayFK` FOREIGN KEY (`friday`) REFERENCES `dishes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `mondayFK` FOREIGN KEY (`monday`) REFERENCES `dishes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `thursdayFK` FOREIGN KEY (`thursday`) REFERENCES `dishes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tuesdayFK` FOREIGN KEY (`tuesday`) REFERENCES `dishes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `wednesdayFK` FOREIGN KEY (`wednesday`) REFERENCES `dishes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table menustander.weekmenus: ~2 rows (approximately)
DELETE FROM `weekmenus`;
/*!40000 ALTER TABLE `weekmenus` DISABLE KEYS */;
INSERT INTO `weekmenus` (`id`, `monday`, `tuesday`, `wednesday`, `thursday`, `friday`, `mondaycheck`, `tuesdaycheck`, `wednesdaycheck`, `thursdaycheck`, `fridaycheck`) VALUES
	(1, 6, 5, 1, 4, 2, 1, 1, 1, 1, 1),
	(3, 2, 3, 5, 1, 2, 1, 1, 1, 1, 1);
/*!40000 ALTER TABLE `weekmenus` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
