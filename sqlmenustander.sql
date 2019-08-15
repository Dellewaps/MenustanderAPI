-- --------------------------------------------------------
-- Vært:                         localhost
-- Server-version:               5.7.19 - MySQL Community Server (GPL)
-- ServerOS:                     Win64
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for menustander
CREATE DATABASE IF NOT EXISTS `menustander` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `menustander`;

-- Dumping structure for tabel menustander.dailies
CREATE TABLE IF NOT EXISTS `dailies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sideone` int(11) DEFAULT NULL,
  `sidetwo` int(11) DEFAULT NULL,
  `sidethree` int(11) DEFAULT NULL,
  `sidefour` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table menustander.dailies: ~4 rows (approximately)
/*!40000 ALTER TABLE `dailies` DISABLE KEYS */;
INSERT INTO `dailies` (`id`, `description`, `sideone`, `sidetwo`, `sidethree`, `sidefour`) VALUES
	(3, 'med ris', 1, 2, NULL, NULL),
	(4, 'med ris', 2, 1, NULL, NULL),
	(5, 'med sovs', 1, 2, NULL, NULL),
	(6, 'sovs', 1, 0, 0, 0),
	(7, 'kartoffler, rødkålog brun sovs', 0, 0, 0, 0);
/*!40000 ALTER TABLE `dailies` ENABLE KEYS */;

-- Dumping structure for tabel menustander.dishes
CREATE TABLE IF NOT EXISTS `dishes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `accessories` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table menustander.dishes: ~4 rows (approximately)
/*!40000 ALTER TABLE `dishes` DISABLE KEYS */;
INSERT INTO `dishes` (`id`, `name`, `accessories`, `price`, `photo`) VALUES
	(1, 'Stegt flæsk', 'kartoffler, rødbeder og persillesovs', 25, '_1557387950.jpg'),
	(2, 'Frikadeller', 'kartoffler, rødkålog brun sovs', 20, '_1557388004.jpg'),
	(3, 'ribbensandwich', 'rødkål og syltede agurker', 25, '_1557388041.jpg'),
	(4, 'Mørbradgryde', 'med ris', 20, '_1557388062.jpg'),
	(8, 'Kyllingelår', 'Tomatsovs', 20, '2732_630x315.jpg');
/*!40000 ALTER TABLE `dishes` ENABLE KEYS */;

-- Dumping structure for tabel menustander.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table menustander.migrations: ~6 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(12, '2014_10_12_000000_create_users_table', 1),
	(13, '2014_10_12_100000_create_password_resets_table', 1),
	(14, '2019_04_09_101729_create_dishes_table', 1),
	(15, '2019_04_09_105358_create_side_dishes_table', 1),
	(16, '2019_05_06_075043_create_weekmenu_table', 1),
	(17, '2019_05_08_063234_create_dailies_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for tabel menustander.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table menustander.password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for tabel menustander.side_dishes
CREATE TABLE IF NOT EXISTS `side_dishes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table menustander.side_dishes: ~4 rows (approximately)
/*!40000 ALTER TABLE `side_dishes` DISABLE KEYS */;
INSERT INTO `side_dishes` (`id`, `name`, `description`) VALUES
	(1, 'Sandwich', 'kylling og bacon'),
	(2, 'Sandwich', 'med rostbeef'),
	(3, 'sandwich', 'Tun'),
	(4, 'sandwich', 'pulledpork');
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

-- Dumping structure for tabel menustander.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table menustander.users: ~1 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `password`) VALUES
	(3, 'test', '$2y$10$lVrPXrOo.g/Om1Os2CicteoLoxaClbgTYVeWsq5Wfm/nHsUD6cWCi');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for tabel menustander.weekmenus
CREATE TABLE IF NOT EXISTS `weekmenus` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `monday` int(11) NOT NULL,
  `tuesday` int(11) NOT NULL,
  `wednesday` int(11) NOT NULL,
  `thursday` int(11) NOT NULL,
  `friday` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table menustander.weekmenus: ~2 rows (approximately)
/*!40000 ALTER TABLE `weekmenus` DISABLE KEYS */;
INSERT INTO `weekmenus` (`id`, `monday`, `tuesday`, `wednesday`, `thursday`, `friday`) VALUES
	(1, 2, 1, 2, 1, 2),
	(2, 1, 1, 2, 1, 1),
	(3, 2, 1, 1, 2, 1),
	(4, 1, 2, 3, 4, 5),
	(5, 1, 2, 3, 4, 1),
	(6, 3, 4, 2, 1, 1);
/*!40000 ALTER TABLE `weekmenus` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
