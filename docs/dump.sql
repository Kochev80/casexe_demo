-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               10.1.32-MariaDB - mariadb.org binary distribution
-- Операционная система:         Win32
-- HeidiSQL Версия:              9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Дамп структуры базы данных casexe
CREATE DATABASE IF NOT EXISTS `casexe` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `casexe`;

-- Дамп структуры для таблица casexe.delivery
CREATE TABLE IF NOT EXISTS `delivery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_item` int(11) NOT NULL DEFAULT '0',
  `id_user` int(11) NOT NULL DEFAULT '0',
  `fl_accept` tinyint(4) NOT NULL DEFAULT '0',
  `fl_send` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы casexe.delivery: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
REPLACE INTO `delivery` (`id`, `id_item`, `id_user`, `fl_accept`, `fl_send`) VALUES
	(13, 3, 1, 1, 0),
	(18, 2, 1, 1, 0);
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;

-- Дамп структуры для таблица casexe.items
CREATE TABLE IF NOT EXISTS `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `amount` int(11) NOT NULL DEFAULT '0',
  `cost` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы casexe.items: ~4 rows (приблизительно)
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
REPLACE INTO `items` (`id`, `name`, `amount`, `cost`) VALUES
	(1, 'Телефон', 3, 300),
	(2, 'Кот №1', 7, 150),
	(3, 'Кот №2', 6, 200),
	(4, 'Кот №3', 7, 70);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;

-- Дамп структуры для таблица casexe.params
CREATE TABLE IF NOT EXISTS `params` (
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` decimal(10,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы casexe.params: ~10 rows (приблизительно)
/*!40000 ALTER TABLE `params` DISABLE KEYS */;
REPLACE INTO `params` (`name`, `value`) VALUES
	('money', 970.00),
	('money2bonus', 2.00),
	('item2money', 0.80),
	('money_min', 1.00),
	('money_max', 50.00),
	('bonus_min', 2.00),
	('bonus_max', 100.00),
	('chance_bonus', 40.00),
	('chance_money', 40.00),
	('chance_item', 20.00);
/*!40000 ALTER TABLE `params` ENABLE KEYS */;

-- Дамп структуры для таблица casexe.payments
CREATE TABLE IF NOT EXISTS `payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL DEFAULT '0',
  `money` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы casexe.payments: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;

-- Дамп структуры для таблица casexe.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `session_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `ip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `agent` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stamp` int(11) DEFAULT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы casexe.sessions: ~2 rows (приблизительно)
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
REPLACE INTO `sessions` (`session_id`, `data`, `ip`, `agent`, `stamp`) VALUES
	('8evbkrpe3bn9ej0c8vq2vuf6hc', 'user_id|s:1:"1";', '::1', 'PostmanRuntime/7.3.0', 1537061713),
	('8goshdtitq4j04nhgslpcovu47', 'user_id|s:1:"1";baraban|a:10:{i:1;a:2:{s:3:"typ";s:5:"bonus";s:6:"amount";i:94;}i:2;a:2:{s:3:"typ";s:4:"item";s:4:"item";a:2:{s:2:"id";s:1:"2";s:4:"name";s:11:"Кот №1";}}i:3;a:2:{s:3:"typ";s:5:"bonus";s:6:"amount";i:68;}i:4;a:2:{s:3:"typ";s:5:"bonus";s:6:"amount";i:26;}i:5;a:2:{s:3:"typ";s:5:"money";s:6:"amount";i:41;}i:6;a:2:{s:3:"typ";s:5:"money";s:6:"amount";i:43;}i:7;a:2:{s:3:"typ";s:5:"money";s:6:"amount";i:24;}i:8;a:2:{s:3:"typ";s:5:"money";s:6:"amount";i:21;}i:9;a:2:{s:3:"typ";s:5:"bonus";s:6:"amount";i:90;}i:10;a:2:{s:3:"typ";s:5:"money";s:6:"amount";i:22;}}', '::1', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:62.0) Gecko/20100101 Firefox/62.0', 1537061850);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;

-- Дамп структуры для таблица casexe.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pass` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `bonus` int(11) NOT NULL DEFAULT '0',
  `money_out` int(11) NOT NULL DEFAULT '0',
  `money_win` int(11) NOT NULL DEFAULT '0',
  `card` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `addr` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы casexe.users: ~1 rows (приблизительно)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
REPLACE INTO `users` (`id`, `login`, `pass`, `bonus`, `money_out`, `money_win`, `card`, `addr`) VALUES
	(1, 'testuser', '*00E247AC5F9AF26AE0194B41E1E769DEE1429A29', 2786, 522, 0, '1111222233334444', 'Екатеринбург, Ленина 24, кв.17');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
