/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-12.0.2-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: consultorio_psicologico
-- ------------------------------------------------------
-- Server version	8.4.6

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `access_logs`
--

DROP TABLE IF EXISTS `access_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `access_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `request_method` varchar(10) DEFAULT NULL,
  `request_uri` varchar(255) DEFAULT NULL,
  `response_status` int DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=815 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_logs`
--

LOCK TABLES `access_logs` WRITE;
/*!40000 ALTER TABLE `access_logs` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `access_logs` VALUES
(1,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login',200,'2025-11-13 05:41:46'),
(2,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-13 05:41:53'),
(3,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-13 05:41:53'),
(4,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/auth/failed-logins',200,'2025-11-13 05:41:53'),
(5,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/registros',200,'2025-11-13 05:41:55'),
(6,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/registros',200,'2025-11-13 05:42:32'),
(7,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/registros',200,'2025-11-13 05:45:02'),
(8,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/empleados',200,'2025-11-13 05:45:07'),
(9,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/registros',200,'2025-11-13 05:45:08'),
(10,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/registros',200,'2025-11-13 05:45:14'),
(11,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/registros',200,'2025-11-13 05:45:15'),
(12,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/registros',200,'2025-11-13 05:45:39'),
(13,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/registros',200,'2025-11-13 06:03:12'),
(14,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/empleados',200,'2025-11-13 06:03:43'),
(15,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/empleados',200,'2025-11-13 06:03:55'),
(16,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/registros',200,'2025-11-13 06:04:00'),
(17,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/registros',200,'2025-11-13 06:08:12'),
(18,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-13 06:08:14'),
(19,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-13 06:15:45'),
(20,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','POST','/configuracion/maintenance/enable',302,'2025-11-13 06:15:56'),
(21,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-13 06:15:56'),
(22,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login',200,'2025-11-13 06:16:07'),
(23,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login',200,'2025-11-13 06:16:24'),
(24,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-13 06:39:17'),
(25,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-13 06:39:25'),
(26,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-13 06:39:26'),
(27,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-13 06:39:47'),
(28,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-13 06:39:48'),
(29,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-13 06:43:44'),
(30,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-13 06:43:44'),
(31,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/auth/failed-logins',200,'2025-11-13 06:43:44'),
(32,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/empleados',200,'2025-11-13 06:43:47'),
(33,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/registros',200,'2025-11-13 06:43:48'),
(34,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-13 06:44:00'),
(35,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','POST','/configuracion/timezone/update',302,'2025-11-13 06:44:30'),
(36,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-13 06:44:30'),
(37,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','POST','/configuracion/timezone/update',302,'2025-11-13 06:44:33'),
(38,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-13 06:44:33'),
(39,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-13 06:44:36'),
(40,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-13 06:44:38'),
(41,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-13 06:44:38'),
(42,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-13 06:44:38'),
(43,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','POST','/configuracion/timezone/update',302,'2025-11-13 06:44:45'),
(44,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-13 06:44:45'),
(45,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-13 06:45:07'),
(46,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-13 06:45:24'),
(47,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-13 06:45:25'),
(48,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-13 06:45:25'),
(49,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','POST','/configuracion/timezone/update',302,'2025-11-13 06:45:32'),
(50,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-13 06:45:32'),
(51,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-13 06:45:35'),
(52,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-13 06:45:36'),
(53,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','POST','/configuracion/timezone/update',302,'2025-11-13 06:46:09'),
(54,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-13 06:46:09'),
(55,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','POST','/configuracion/timezone/update',302,'2025-11-13 06:46:11'),
(56,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-13 06:46:11'),
(57,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-13 06:52:09'),
(58,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-13 06:52:10'),
(59,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-13 06:52:11'),
(60,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','POST','/configuracion/timezone/update',302,'2025-11-13 06:56:06'),
(61,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-13 06:56:06'),
(62,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-13 07:03:09'),
(63,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','POST','/configuracion/maintenance/disable',302,'2025-11-13 07:03:26'),
(64,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-13 07:03:26'),
(65,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/',200,'2025-11-13 07:03:27'),
(66,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-13 07:06:43'),
(67,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-13 07:13:48'),
(68,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-13 07:15:05'),
(69,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-13 07:15:27'),
(70,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-13 07:20:00'),
(71,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-13 07:22:59'),
(72,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','POST','/configuracion/views/update',302,'2025-11-13 07:23:11'),
(73,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-13 07:23:11'),
(74,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','POST','/configuracion/views/update',302,'2025-11-13 07:23:14'),
(75,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-13 07:23:15'),
(76,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','POST','/configuracion/views/update',302,'2025-11-13 07:23:21'),
(77,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-13 07:23:21'),
(78,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/empleados',200,'2025-11-13 07:23:23'),
(79,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-13 07:23:27'),
(80,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','POST','/configuracion/views/update',302,'2025-11-13 07:23:30'),
(81,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-13 07:23:30'),
(82,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','POST','/configuracion/views/update',302,'2025-11-13 07:23:47'),
(83,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-13 07:23:47'),
(84,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/empleados',200,'2025-11-13 07:23:48'),
(85,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-13 07:25:15'),
(86,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login',200,'2025-11-13 07:25:53'),
(87,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-13 07:26:48'),
(88,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','POST','/configuracion/views/update',302,'2025-11-13 07:27:01'),
(89,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-13 07:27:01'),
(90,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-13 07:27:03'),
(91,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-13 07:30:45'),
(92,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-13 07:30:46'),
(93,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-13 07:30:52'),
(94,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/backup',200,'2025-11-13 07:30:54'),
(95,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','POST','/backup/create',302,'2025-11-13 07:31:00'),
(96,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/backup',200,'2025-11-13 07:31:00'),
(97,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login',200,'2025-11-13 20:28:16'),
(98,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-13 20:28:24'),
(99,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-13 20:28:24'),
(100,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/auth/failed-logins',200,'2025-11-13 20:28:24'),
(101,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-13 20:28:34'),
(102,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/empleados',200,'2025-11-13 20:28:37'),
(103,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/empleados',200,'2025-11-13 20:37:49'),
(104,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/home',200,'2025-11-13 20:37:52'),
(105,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/home',200,'2025-11-13 20:37:59'),
(106,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-13 20:38:05'),
(107,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-13 20:38:05'),
(108,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/auth/failed-logins',200,'2025-11-13 20:38:05'),
(109,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login',200,'2025-11-13 20:38:08'),
(110,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login',200,'2025-11-13 20:38:18'),
(111,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login',200,'2025-11-13 20:38:24'),
(112,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/home',200,'2025-11-13 20:38:42'),
(113,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/home',200,'2025-11-13 20:38:45'),
(114,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-13 20:38:49'),
(115,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-13 20:38:49'),
(116,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/auth/failed-logins',200,'2025-11-13 20:38:49'),
(117,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-13 20:38:59'),
(118,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-13 20:39:09'),
(119,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-13 20:39:20'),
(120,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-13 20:39:30'),
(121,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-13 20:39:40'),
(122,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-13 20:39:50'),
(123,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-13 20:40:00'),
(124,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-13 20:40:10'),
(125,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-13 20:40:50'),
(126,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/empleados',200,'2025-11-13 20:40:54'),
(127,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/registros',200,'2025-11-13 20:41:01'),
(128,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login',200,'2025-11-13 20:47:40'),
(129,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/home',200,'2025-11-13 20:47:47'),
(130,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-13 20:48:00'),
(131,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-13 20:48:02'),
(132,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login',200,'2025-11-13 20:48:06'),
(133,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/home',200,'2025-11-13 20:48:14'),
(134,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-13 20:48:18'),
(135,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login',200,'2025-11-13 20:48:21'),
(136,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/home',200,'2025-11-13 20:48:28'),
(137,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-13 20:48:36'),
(138,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-13 20:48:36'),
(139,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/auth/failed-logins',200,'2025-11-13 20:48:36'),
(140,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-13 20:48:46'),
(141,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/empleados',200,'2025-11-13 20:48:54'),
(142,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/empleados',200,'2025-11-13 20:50:14'),
(143,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login',200,'2025-11-13 20:50:20'),
(144,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/home',200,'2025-11-13 20:50:53'),
(145,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-13 20:51:02'),
(146,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login',200,'2025-11-13 21:07:14'),
(147,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/home',200,'2025-11-13 21:07:22'),
(148,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-13 21:07:29'),
(149,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-13 21:07:29'),
(150,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/auth/failed-logins',200,'2025-11-13 21:07:29'),
(151,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/empleados',200,'2025-11-13 21:07:34'),
(152,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/empleados',200,'2025-11-13 21:08:28'),
(153,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login',200,'2025-11-13 21:08:31'),
(154,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/home',200,'2025-11-13 21:08:40'),
(155,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-13 21:08:46'),
(156,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-13 21:09:48'),
(157,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login',200,'2025-11-13 21:09:51'),
(158,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/home',200,'2025-11-13 21:09:56'),
(159,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-13 21:10:05'),
(160,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-13 21:10:06'),
(161,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/auth/failed-logins',200,'2025-11-13 21:10:06'),
(162,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-13 21:10:08'),
(163,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','POST','/configuracion/views/update',302,'2025-11-13 21:10:13'),
(164,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-13 21:10:13'),
(165,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login',200,'2025-11-13 21:10:27'),
(166,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/home',200,'2025-11-13 21:10:46'),
(167,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-13 21:10:52'),
(168,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-13 21:10:55'),
(169,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/',200,'2025-11-13 21:11:57'),
(170,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-13 21:12:01'),
(171,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login',200,'2025-11-13 21:12:03'),
(172,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-13 21:12:12'),
(173,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login',200,'2025-11-13 21:12:17'),
(174,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-13 21:12:19'),
(175,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login',200,'2025-11-13 21:14:22'),
(176,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login',200,'2025-11-13 21:14:25'),
(177,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-13 21:14:29'),
(178,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-13 21:14:33'),
(179,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-13 21:14:41'),
(180,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-13 21:16:48'),
(181,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-13 23:00:45'),
(182,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','POST','/pacientes/crear',200,'2025-11-13 23:01:34'),
(183,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-13 23:01:39'),
(184,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-13 23:01:40'),
(185,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-13 23:01:41'),
(186,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-13 23:01:41'),
(187,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-13 23:01:41'),
(188,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-13 23:01:41'),
(189,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-13 23:07:38'),
(190,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','POST','/pacientes/crear',200,'2025-11-14 01:12:02'),
(191,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-14 01:18:11'),
(192,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-14 01:28:39'),
(193,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-14 01:29:06'),
(194,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-14 01:31:50'),
(195,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-14 01:31:51'),
(196,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-14 01:31:52'),
(197,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-14 01:31:52'),
(198,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-14 01:31:52'),
(199,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-14 01:31:52'),
(200,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-14 01:31:52'),
(201,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-14 01:31:52'),
(202,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-14 01:31:53'),
(203,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-14 01:31:53'),
(204,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-14 01:35:46'),
(205,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','POST','/pacientes/crear',200,'2025-11-14 01:58:55'),
(206,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-14 01:59:52'),
(207,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-14 02:07:16'),
(208,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=A',200,'2025-11-14 02:07:18'),
(209,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=Al',200,'2025-11-14 02:07:18'),
(210,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=Ale',200,'2025-11-14 02:07:19'),
(211,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=Alex',200,'2025-11-14 02:07:20'),
(212,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=Alex%20',200,'2025-11-14 02:07:21'),
(213,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=Alex',200,'2025-11-14 02:07:23'),
(214,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=Alexi',200,'2025-11-14 02:07:27'),
(215,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=Alexis',200,'2025-11-14 02:07:27'),
(216,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=Alexi',200,'2025-11-14 02:07:28'),
(217,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=Alex',200,'2025-11-14 02:07:29'),
(218,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=Alex%20',200,'2025-11-14 02:07:30'),
(219,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=Alex',200,'2025-11-14 02:07:33'),
(220,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=AlexA',200,'2025-11-14 02:07:34'),
(221,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=AlexAl',200,'2025-11-14 02:07:35'),
(222,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=AlexAle',200,'2025-11-14 02:07:35'),
(223,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=AlexAl',200,'2025-11-14 02:07:35'),
(224,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=AlexA',200,'2025-11-14 02:07:35'),
(225,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=Alex',200,'2025-11-14 02:07:36'),
(226,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=Alexi',200,'2025-11-14 02:07:43'),
(227,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=Alexis',200,'2025-11-14 02:07:43'),
(228,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=Alexis%20',200,'2025-11-14 02:07:43'),
(229,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=Alexis%20R',200,'2025-11-14 02:07:44'),
(230,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=Alexis%20',200,'2025-11-14 02:07:44'),
(231,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=Alexis',200,'2025-11-14 02:07:45'),
(232,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=Alexi',200,'2025-11-14 02:07:46'),
(233,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=Alex',200,'2025-11-14 02:07:46'),
(234,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=Ale',200,'2025-11-14 02:07:46'),
(235,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=Al',200,'2025-11-14 02:07:46'),
(236,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=A',200,'2025-11-14 02:07:46'),
(237,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=',200,'2025-11-14 02:07:47'),
(238,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=7',200,'2025-11-14 02:07:48'),
(239,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=73',200,'2025-11-14 02:07:48'),
(240,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=7',200,'2025-11-14 02:07:49'),
(241,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=',200,'2025-11-14 02:07:49'),
(242,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=R',200,'2025-11-14 02:07:51'),
(243,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=Ro',200,'2025-11-14 02:07:51'),
(244,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=Rod',200,'2025-11-14 02:07:51'),
(245,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=Ro',200,'2025-11-14 02:07:54'),
(246,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=R',200,'2025-11-14 02:07:54'),
(247,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=',200,'2025-11-14 02:07:54'),
(248,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=A',200,'2025-11-14 02:09:54'),
(249,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=Ae',200,'2025-11-14 02:09:55'),
(250,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=A',200,'2025-11-14 02:09:55'),
(251,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=Al',200,'2025-11-14 02:09:56'),
(252,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=Ale',200,'2025-11-14 02:09:56'),
(253,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=Alex',200,'2025-11-14 02:09:56'),
(254,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=Alex%20',200,'2025-11-14 02:09:57'),
(255,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=Alex%20A',200,'2025-11-14 02:09:58'),
(256,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=Alex%20Al',200,'2025-11-14 02:09:58'),
(257,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=Alex%20Ale',200,'2025-11-14 02:09:59'),
(258,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=Alex%20Al',200,'2025-11-14 02:09:59'),
(259,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=Alex%20A',200,'2025-11-14 02:09:59'),
(260,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=Alex%20',200,'2025-11-14 02:10:00'),
(261,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=Alex',200,'2025-11-14 02:10:00'),
(262,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=Ale',200,'2025-11-14 02:10:00'),
(263,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=Al',200,'2025-11-14 02:10:00'),
(264,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=A',200,'2025-11-14 02:10:00'),
(265,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=',200,'2025-11-14 02:10:00'),
(266,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=5',200,'2025-11-14 02:10:01'),
(267,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=56',200,'2025-11-14 02:10:01'),
(268,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=569',200,'2025-11-14 02:10:04'),
(269,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=5698',200,'2025-11-14 02:10:04'),
(270,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=569',200,'2025-11-14 02:10:05'),
(271,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=56',200,'2025-11-14 02:10:06'),
(272,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=5',200,'2025-11-14 02:10:06'),
(273,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=',200,'2025-11-14 02:10:06'),
(274,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-14 02:28:14'),
(275,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=ale',200,'2025-11-14 02:28:19'),
(276,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=alex',200,'2025-11-14 02:28:19'),
(277,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=',200,'2025-11-14 02:28:21'),
(278,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/buscar?term=Alexis%20Rodri',200,'2025-11-14 02:28:24'),
(279,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login',200,'2025-11-14 03:32:00'),
(280,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login',200,'2025-11-14 03:32:02'),
(281,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-14 03:33:08'),
(282,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-14 03:33:34'),
(283,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-14 03:44:39'),
(284,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/ver/1',200,'2025-11-14 03:44:41'),
(285,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/ver/3',200,'2025-11-14 03:44:48'),
(286,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/ver/2',200,'2025-11-14 03:44:53'),
(287,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/ver/1',200,'2025-11-14 03:45:02'),
(288,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/ver/3',200,'2025-11-14 03:45:05'),
(289,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/ver/1',200,'2025-11-14 03:45:23'),
(290,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login',200,'2025-11-14 03:54:44'),
(291,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login',200,'2025-11-15 00:28:03'),
(292,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 00:28:23'),
(293,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-15 00:28:26'),
(294,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/ver/1',200,'2025-11-15 00:29:55'),
(295,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-15 00:33:32'),
(296,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-15 00:36:43'),
(297,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','POST','/pacientes/delete',200,'2025-11-15 00:36:47'),
(298,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','POST','/pacientes/delete',200,'2025-11-15 00:36:53'),
(299,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','POST','/pacientes/delete',200,'2025-11-15 00:38:52'),
(300,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','POST','/pacientes/delete',200,'2025-11-15 00:40:43'),
(301,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-15 00:41:48'),
(302,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-15 00:41:49'),
(303,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-15 00:42:16'),
(304,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','POST','/pacientes/delete',200,'2025-11-15 00:43:34'),
(305,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-15 00:43:44'),
(306,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-15 00:43:45'),
(307,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-15 00:43:45'),
(308,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-15 00:43:45'),
(309,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-15 00:43:46'),
(310,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-15 00:43:46'),
(311,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-15 00:43:46'),
(312,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-15 00:43:46'),
(313,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-15 00:43:46'),
(314,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-15 00:43:46'),
(315,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-15 00:43:47'),
(316,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','POST','/pacientes/delete',200,'2025-11-15 00:45:36'),
(317,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','POST','/pacientes/delete',200,'2025-11-15 00:45:41'),
(318,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','POST','/pacientes/delete',200,'2025-11-15 00:45:59'),
(319,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-15 01:02:03'),
(320,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','POST','/pacientes/delete',200,'2025-11-15 01:09:19'),
(321,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','POST','/pacientes/delete',200,'2025-11-15 01:09:27'),
(322,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-15 01:09:35'),
(323,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-15 01:09:39'),
(324,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-15 01:09:47'),
(325,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-15 01:09:56'),
(326,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','POST','/pacientes/delete',200,'2025-11-15 01:10:38'),
(327,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','POST','/pacientes/delete',200,'2025-11-15 01:11:28'),
(328,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','POST','/pacientes/delete',200,'2025-11-15 01:13:43'),
(329,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-15 01:15:15'),
(330,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-15 01:31:42'),
(331,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','POST','/pacientes/eliminar/3',200,'2025-11-15 01:31:45'),
(332,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-15 01:32:27'),
(333,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-15 01:33:10'),
(334,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login',200,'2025-11-15 01:34:06'),
(335,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 01:36:18'),
(336,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 01:36:18'),
(337,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/auth/failed-logins',200,'2025-11-15 01:36:18'),
(338,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 01:36:28'),
(339,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 01:36:38'),
(340,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 01:36:48'),
(341,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/empleados',200,'2025-11-15 01:36:52'),
(342,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/registros',200,'2025-11-15 01:37:00'),
(343,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/registros',200,'2025-11-15 01:38:26'),
(344,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 01:38:50'),
(345,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 01:38:50'),
(346,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/auth/failed-logins',200,'2025-11-15 01:38:50'),
(347,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 01:39:00'),
(348,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 01:39:01'),
(349,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 01:39:01'),
(350,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/auth/failed-logins',200,'2025-11-15 01:39:01'),
(351,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 01:39:11'),
(352,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 01:39:21'),
(353,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 01:39:31'),
(354,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 01:39:41'),
(355,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 01:39:51'),
(356,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 01:40:01'),
(357,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 01:40:11'),
(358,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 01:40:21'),
(359,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 01:40:31'),
(360,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 01:40:41'),
(361,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 01:40:51'),
(362,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 01:41:01'),
(363,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 01:41:11'),
(364,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 01:41:21'),
(365,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 01:41:31'),
(366,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 01:41:41'),
(367,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 01:41:51'),
(368,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 01:42:21'),
(369,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 01:43:21'),
(370,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 01:44:21'),
(371,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 01:45:21'),
(372,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 01:46:21'),
(373,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 01:47:21'),
(374,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 01:48:21'),
(375,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 01:49:21'),
(376,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 01:49:31'),
(377,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login',200,'2025-11-15 01:49:32'),
(378,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login?error=Credenciales%20incorrectas',200,'2025-11-15 01:49:46'),
(379,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 01:49:56'),
(380,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 01:49:57'),
(381,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/auth/failed-logins',200,'2025-11-15 01:49:57'),
(382,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login',200,'2025-11-15 01:49:59'),
(383,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 01:50:07'),
(384,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 01:50:10'),
(385,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login',200,'2025-11-15 01:50:12'),
(386,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 01:50:19'),
(387,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-15 01:50:25'),
(388,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','POST','/pacientes/eliminar/3',200,'2025-11-15 01:50:31'),
(389,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-15 01:55:33'),
(390,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 01:55:40'),
(391,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login',200,'2025-11-15 01:55:52'),
(392,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 01:55:59'),
(393,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 01:55:59'),
(394,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/auth/failed-logins',200,'2025-11-15 01:55:59'),
(395,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 01:56:09'),
(396,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 01:56:19'),
(397,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 01:56:29'),
(398,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 01:56:39'),
(399,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 01:56:49'),
(400,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 01:56:59'),
(401,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 01:57:09'),
(402,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 01:57:19'),
(403,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 01:57:29'),
(404,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 01:57:39'),
(405,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/empleados',200,'2025-11-15 01:57:46'),
(406,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/empleados',200,'2025-11-15 02:01:36'),
(407,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/empleados',200,'2025-11-15 02:02:24'),
(408,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/empleados',200,'2025-11-15 02:02:25'),
(409,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/reportes',200,'2025-11-15 02:06:05'),
(410,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/reportes',200,'2025-11-15 02:06:25'),
(411,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-15 02:06:27'),
(412,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/reportes',200,'2025-11-15 02:06:28'),
(413,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/backup',200,'2025-11-15 02:07:02'),
(414,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-15 02:07:05'),
(415,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/backup',200,'2025-11-15 02:07:06'),
(416,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/reportes',200,'2025-11-15 02:07:08'),
(417,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/backup',200,'2025-11-15 02:07:21'),
(418,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/empleados',200,'2025-11-15 02:07:22'),
(419,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-15 02:07:25'),
(420,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/empleados',200,'2025-11-15 02:07:28'),
(421,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 02:07:29'),
(422,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 02:07:29'),
(423,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/auth/failed-logins',200,'2025-11-15 02:07:29'),
(424,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/empleados',200,'2025-11-15 02:07:32'),
(425,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/backup',200,'2025-11-15 02:07:39'),
(426,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/reportes',200,'2025-11-15 02:07:45'),
(427,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 02:07:47'),
(428,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 02:07:47'),
(429,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/auth/failed-logins',200,'2025-11-15 02:07:47'),
(430,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/empleados',200,'2025-11-15 02:07:50'),
(431,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/reportes',200,'2025-11-15 02:07:52'),
(432,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-15 02:07:55'),
(433,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/backup',200,'2025-11-15 02:07:58'),
(434,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/registros',200,'2025-11-15 02:08:01'),
(435,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/registros',200,'2025-11-15 02:08:11'),
(436,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/empleados',200,'2025-11-15 02:08:38'),
(437,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/registros',200,'2025-11-15 02:08:44'),
(438,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login',200,'2025-11-15 02:11:40'),
(439,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 02:11:46'),
(440,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 02:12:06'),
(441,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/auth/failed-logins',200,'2025-11-15 02:12:06'),
(442,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/reportes',200,'2025-11-15 02:12:10'),
(443,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/reportes',200,'2025-11-15 02:13:22'),
(444,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/reportes',200,'2025-11-15 02:17:01'),
(445,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/reportes',200,'2025-11-15 02:17:20'),
(446,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/reportes',200,'2025-11-15 02:27:07'),
(447,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/reportes',200,'2025-11-15 02:27:16'),
(448,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/reportes',200,'2025-11-15 02:36:49'),
(449,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/reportes',200,'2025-11-15 02:43:02'),
(450,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/reportes',200,'2025-11-15 02:43:10'),
(451,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/reportes',200,'2025-11-15 02:43:11'),
(452,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/reportes',200,'2025-11-15 02:43:12'),
(453,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/reportes',200,'2025-11-15 02:43:59'),
(454,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/reportes',200,'2025-11-15 03:04:00'),
(455,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/reportes',200,'2025-11-15 03:04:32'),
(456,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/reportes',200,'2025-11-15 03:04:33'),
(457,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/reportes',200,'2025-11-15 03:04:34'),
(458,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/empleados',200,'2025-11-15 03:04:35'),
(459,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login',200,'2025-11-15 03:04:50'),
(460,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 03:05:03'),
(461,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login',200,'2025-11-15 03:05:05'),
(462,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login?error=Credenciales%20incorrectas',200,'2025-11-15 03:05:11'),
(463,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 03:05:17'),
(464,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 03:05:17'),
(465,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/auth/failed-logins',200,'2025-11-15 03:05:17'),
(466,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login',200,'2025-11-15 03:05:20'),
(467,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 03:05:47'),
(468,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-15 03:05:53'),
(469,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-15 03:06:04'),
(470,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-15 03:06:05'),
(471,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-15 03:06:05'),
(472,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login',200,'2025-11-15 03:09:05'),
(473,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login?error=Credenciales%20incorrectas',200,'2025-11-15 03:09:22'),
(474,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 03:09:33'),
(475,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 03:11:16'),
(476,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 03:11:17'),
(477,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 03:11:17'),
(478,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 03:11:18'),
(479,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 03:11:18'),
(480,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 03:11:57'),
(481,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 03:12:21'),
(482,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 03:12:22'),
(483,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-15 03:12:23'),
(484,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login',200,'2025-11-15 03:12:37'),
(485,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 03:12:44'),
(486,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 03:12:44'),
(487,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/auth/failed-logins',200,'2025-11-15 03:12:44'),
(488,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/reportes',200,'2025-11-15 03:12:47'),
(489,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/reportes',200,'2025-11-15 03:13:53'),
(490,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 03:13:54'),
(491,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 03:13:54'),
(492,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/auth/failed-logins',200,'2025-11-15 03:13:54'),
(493,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 03:13:55'),
(494,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 03:13:55'),
(495,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/auth/failed-logins',200,'2025-11-15 03:13:55'),
(496,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-15 03:13:56'),
(497,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login',200,'2025-11-15 03:13:57'),
(498,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 03:14:03'),
(499,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-15 03:14:05'),
(500,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 03:14:07'),
(501,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 03:14:56'),
(502,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 03:14:57'),
(503,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/reportes/pacientes',200,'2025-11-15 03:14:59'),
(504,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login',200,'2025-11-15 03:15:15'),
(505,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 03:15:20'),
(506,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 03:15:20'),
(507,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/auth/failed-logins',200,'2025-11-15 03:15:20'),
(508,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 03:15:30'),
(509,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 03:15:40'),
(510,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 03:15:50'),
(511,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 03:16:00'),
(512,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 03:16:10'),
(513,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 03:16:20'),
(514,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 03:16:30'),
(515,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 03:16:40'),
(516,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 03:16:50'),
(517,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 03:17:00'),
(518,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 03:17:10'),
(519,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 03:17:20'),
(520,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 03:17:30'),
(521,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 03:17:40'),
(522,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 03:17:50'),
(523,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 03:18:00'),
(524,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 03:18:10'),
(525,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 03:18:15'),
(526,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 03:18:16'),
(527,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/auth/failed-logins',200,'2025-11-15 03:18:16'),
(528,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 03:18:26'),
(529,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 03:18:36'),
(530,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 03:18:46'),
(531,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 03:18:56'),
(532,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 03:19:06'),
(533,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 03:19:16'),
(534,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 03:19:26'),
(535,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 03:19:33'),
(536,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 03:19:33'),
(537,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/auth/failed-logins',200,'2025-11-15 03:19:33'),
(538,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/reportes',200,'2025-11-15 03:19:35'),
(539,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login',200,'2025-11-15 03:19:46'),
(540,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login?error=Credenciales%20incorrectas',200,'2025-11-15 03:20:07'),
(541,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 03:20:19'),
(542,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/reportes/pacientes',200,'2025-11-15 03:20:22'),
(543,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/reportes',200,'2025-11-15 03:20:23'),
(544,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/reportes',200,'2025-11-15 03:20:32'),
(545,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/reportes/pacientes',200,'2025-11-15 03:20:32'),
(546,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/reportes',200,'2025-11-15 03:20:36'),
(547,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/reportes/pacientes',200,'2025-11-15 03:20:42'),
(548,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/reportes',200,'2025-11-15 03:20:47'),
(549,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/reportes',200,'2025-11-15 03:22:11'),
(550,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/reportes/pacientes',200,'2025-11-15 03:22:12'),
(551,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/reportes/pacientes',200,'2025-11-15 05:59:23'),
(552,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login',200,'2025-11-15 05:59:26'),
(553,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 05:59:34'),
(554,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 05:59:34'),
(555,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/auth/failed-logins',200,'2025-11-15 05:59:34'),
(556,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/empleados',200,'2025-11-15 05:59:37'),
(557,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/home',200,'2025-11-15 05:59:40'),
(558,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/empleados',200,'2025-11-15 06:00:59'),
(559,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 06:02:07'),
(560,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:02:07'),
(561,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/auth/failed-logins',200,'2025-11-15 06:02:07'),
(562,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:02:18'),
(563,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:02:28'),
(564,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:02:38'),
(565,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:02:48'),
(566,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:02:58'),
(567,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:03:08'),
(568,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:03:24'),
(569,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:04:24'),
(570,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:05:24'),
(571,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:06:24'),
(572,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:07:24'),
(573,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:08:24'),
(574,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:09:24'),
(575,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:10:24'),
(576,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:11:24'),
(577,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:12:24'),
(578,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:13:05'),
(579,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 06:13:22'),
(580,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:13:22'),
(581,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/auth/failed-logins',200,'2025-11-15 06:13:22'),
(582,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 06:17:06'),
(583,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:17:06'),
(584,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/auth/failed-logins',200,'2025-11-15 06:17:06'),
(585,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 06:21:23'),
(586,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:21:23'),
(587,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/auth/failed-logins',200,'2025-11-15 06:21:23'),
(588,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/empleados',200,'2025-11-15 06:23:26'),
(589,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/empleados',200,'2025-11-15 06:23:43'),
(590,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/empleados',200,'2025-11-15 06:23:48'),
(591,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/empleados',200,'2025-11-15 06:23:52'),
(592,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 06:24:16'),
(593,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:24:17'),
(594,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/auth/failed-logins',200,'2025-11-15 06:24:17'),
(595,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/',200,'2025-11-15 06:24:35'),
(596,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login',200,'2025-11-15 06:24:41'),
(597,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/empleados',200,'2025-11-15 06:24:53'),
(598,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 06:25:06'),
(599,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/',200,'2025-11-15 06:27:22'),
(600,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login',200,'2025-11-15 06:27:28'),
(601,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login?error=Usuario+inactivo.+Contacte+al+administrador.',200,'2025-11-15 06:27:35'),
(602,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login?error=Usuario+inactivo.+Contacte+al+administrador.',200,'2025-11-15 06:29:08'),
(603,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login?error=Usuario+inactivo.+Contacte+al+administrador.',200,'2025-11-15 06:29:09'),
(604,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/inactive-account',200,'2025-11-15 06:31:26'),
(605,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login',200,'2025-11-15 06:31:30'),
(606,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/inactive-account',200,'2025-11-15 06:31:39'),
(607,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/empleados',200,'2025-11-15 06:31:51'),
(608,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/inactive-account',200,'2025-11-15 06:32:05'),
(609,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login',200,'2025-11-15 06:32:07'),
(610,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 06:32:16'),
(611,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login',200,'2025-11-15 06:32:19'),
(612,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/empleados',200,'2025-11-15 06:32:22'),
(613,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 06:32:27'),
(614,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:32:27'),
(615,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/auth/failed-logins',200,'2025-11-15 06:32:27'),
(616,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/empleados',200,'2025-11-15 06:32:30'),
(617,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 06:32:33'),
(618,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:32:33'),
(619,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/auth/failed-logins',200,'2025-11-15 06:32:33'),
(620,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/registros',200,'2025-11-15 06:32:35'),
(621,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 06:32:43'),
(622,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:32:43'),
(623,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/auth/failed-logins',200,'2025-11-15 06:32:43'),
(624,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/reportes',200,'2025-11-15 06:32:44'),
(625,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-15 06:32:46'),
(626,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 06:32:55'),
(627,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:32:55'),
(628,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/auth/failed-logins',200,'2025-11-15 06:32:55'),
(629,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/empleados',200,'2025-11-15 06:32:57'),
(630,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 06:33:07'),
(631,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:33:07'),
(632,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/auth/failed-logins',200,'2025-11-15 06:33:07'),
(633,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:33:17'),
(634,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:33:27'),
(635,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:33:37'),
(636,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:33:47'),
(637,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:33:57'),
(638,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:34:07'),
(639,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:34:17'),
(640,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:34:27'),
(641,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:34:37'),
(642,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:34:47'),
(643,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:34:57'),
(644,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:35:07'),
(645,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:35:17'),
(646,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:35:27'),
(647,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:35:37'),
(648,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:35:47'),
(649,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:35:57'),
(650,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login',200,'2025-11-15 06:36:03'),
(651,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 06:36:09'),
(652,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:36:09'),
(653,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/auth/failed-logins',200,'2025-11-15 06:36:09'),
(654,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/empleados',200,'2025-11-15 06:36:12'),
(655,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 06:36:14'),
(656,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:36:14'),
(657,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/auth/failed-logins',200,'2025-11-15 06:36:14'),
(658,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/registros',200,'2025-11-15 06:36:17'),
(659,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 06:36:19'),
(660,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:36:19'),
(661,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/auth/failed-logins',200,'2025-11-15 06:36:19'),
(662,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/empleados',200,'2025-11-15 06:36:20'),
(663,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 06:36:23'),
(664,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:36:23'),
(665,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/auth/failed-logins',200,'2025-11-15 06:36:23'),
(666,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/empleados',200,'2025-11-15 06:36:28'),
(667,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 06:36:31'),
(668,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:36:31'),
(669,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/auth/failed-logins',200,'2025-11-15 06:36:31'),
(670,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:36:41'),
(671,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:36:51'),
(672,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:37:01'),
(673,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:37:11'),
(674,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:37:21'),
(675,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:37:31'),
(676,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:37:41'),
(677,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:37:51'),
(678,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:38:01'),
(679,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:38:11'),
(680,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:38:21'),
(681,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:38:31'),
(682,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:38:41'),
(683,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:38:51'),
(684,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 06:38:52'),
(685,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:38:53'),
(686,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/auth/failed-logins',200,'2025-11-15 06:38:53'),
(687,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/empleados',200,'2025-11-15 06:38:54'),
(688,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/registros',200,'2025-11-15 06:38:55'),
(689,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/backup',200,'2025-11-15 06:38:57'),
(690,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-15 06:38:59'),
(691,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/reportes',200,'2025-11-15 06:39:01'),
(692,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/empleados',200,'2025-11-15 06:39:05'),
(693,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-15 06:43:38'),
(694,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-15 06:48:41'),
(695,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:48:41'),
(696,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/auth/failed-logins',200,'2025-11-15 06:48:42'),
(697,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:48:52'),
(698,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:49:02'),
(699,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:49:12'),
(700,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:49:22'),
(701,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:49:32'),
(702,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:49:42'),
(703,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:49:52'),
(704,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:50:02'),
(705,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-15 06:50:12'),
(706,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/empleados',200,'2025-11-15 06:50:16'),
(707,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-15 06:52:12'),
(708,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/empleados',200,'2025-11-15 06:52:18'),
(709,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-15 06:52:24'),
(710,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-15 07:07:36'),
(711,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-15 07:07:37'),
(712,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-15 07:08:05'),
(713,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-15 07:08:13'),
(714,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-15 07:08:14'),
(715,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-15 07:08:14'),
(716,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-15 07:08:15'),
(717,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-15 07:08:16'),
(718,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-15 07:08:16'),
(719,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-15 07:08:16'),
(720,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-15 07:08:17'),
(721,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-15 07:08:17'),
(722,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/configuracion',200,'2025-11-15 07:08:17'),
(723,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/planes',200,'2025-11-15 07:08:19'),
(724,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/planes',200,'2025-11-15 07:10:13'),
(725,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login',200,'2025-11-19 04:27:08'),
(726,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-19 04:27:15'),
(727,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-19 04:27:19'),
(728,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-19 04:27:23'),
(729,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login',200,'2025-11-19 04:27:24'),
(730,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-19 04:27:33'),
(731,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-19 04:27:33'),
(732,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/auth/failed-logins',200,'2025-11-19 04:27:33'),
(733,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-19 04:27:36'),
(734,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/system-status',200,'2025-11-19 04:27:36'),
(735,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/auth/failed-logins',200,'2025-11-19 04:27:36'),
(736,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login',200,'2025-11-19 04:27:37'),
(737,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login?error=Credenciales%20incorrectas',200,'2025-11-19 04:27:44'),
(738,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-19 04:27:52'),
(739,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-19 04:39:09'),
(740,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-19 04:39:10'),
(741,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-19 04:39:30'),
(742,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/',200,'2025-11-19 04:39:34'),
(743,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-19 04:39:37'),
(744,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-19 04:39:38'),
(745,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-19 04:39:48'),
(746,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-19 04:45:45'),
(747,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-19 04:46:32'),
(748,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-19 04:49:29'),
(749,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-19 04:49:30'),
(750,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/agenda',200,'2025-11-19 04:49:32'),
(751,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/citas?start=2025-10-26T00%3A00%3A00-05%3A00&end=2025-12-07T00%3A00%3A00-05%3A00',200,'2025-11-19 04:49:32'),
(752,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/reportes/pacientes',200,'2025-11-19 04:49:38'),
(753,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/agenda',200,'2025-11-19 04:49:49'),
(754,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/citas?start=2025-10-26T00%3A00%3A00-05%3A00&end=2025-12-07T00%3A00%3A00-05%3A00',200,'2025-11-19 04:49:49'),
(755,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/citas?start=2025-11-30T00%3A00%3A00-05%3A00&end=2026-01-11T00%3A00%3A00-05%3A00',200,'2025-11-19 04:50:27'),
(756,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/citas?start=2025-12-28T00%3A00%3A00-05%3A00&end=2026-02-08T00%3A00%3A00-05%3A00',200,'2025-11-19 04:50:32'),
(757,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/citas?start=2026-02-01T00%3A00%3A00-05%3A00&end=2026-03-15T00%3A00%3A00-05%3A00',200,'2025-11-19 04:50:34'),
(758,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/citas?start=2025-10-26T00%3A00%3A00-05%3A00&end=2025-12-07T00%3A00%3A00-05%3A00',200,'2025-11-19 04:50:48'),
(759,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/agenda',200,'2025-11-19 05:24:20'),
(760,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/citas?start=2025-10-26T00%3A00%3A00-05%3A00&end=2025-12-07T00%3A00%3A00-05%3A00',200,'2025-11-19 05:24:20'),
(761,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/agenda',200,'2025-11-19 05:24:21'),
(762,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/citas?start=2025-10-26T00%3A00%3A00-05%3A00&end=2025-12-07T00%3A00%3A00-05%3A00',200,'2025-11-19 05:24:21'),
(763,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/agenda',200,'2025-11-19 05:24:22'),
(764,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/citas?start=2025-10-26T00%3A00%3A00-05%3A00&end=2025-12-07T00%3A00%3A00-05%3A00',200,'2025-11-19 05:24:22'),
(765,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes',200,'2025-11-19 05:27:42'),
(766,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/expediente/1',200,'2025-11-19 05:27:46'),
(767,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/expediente/1',200,'2025-11-19 05:37:39'),
(768,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/expediente/1',200,'2025-11-19 05:37:43'),
(769,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/expediente/1',200,'2025-11-19 05:37:47'),
(770,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/expediente/1',200,'2025-11-19 05:37:48'),
(771,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/expediente/1',200,'2025-11-19 05:37:48'),
(772,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/expediente/1',200,'2025-11-19 05:38:08'),
(773,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/expediente/1',200,'2025-11-19 05:38:09'),
(774,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/expediente/1',200,'2025-11-19 05:38:17'),
(775,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/historial/buscar',200,'2025-11-19 05:38:20'),
(776,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/reportes/pacientes',200,'2025-11-19 05:38:22'),
(777,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/historial/buscar',200,'2025-11-19 05:38:24'),
(778,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/expediente/1',200,'2025-11-19 05:39:20'),
(779,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/historial/buscar',200,'2025-11-19 05:44:36'),
(780,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/expediente/1',200,'2025-11-19 05:48:53'),
(781,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/historial/buscar',200,'2025-11-19 05:48:57'),
(782,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/historial/buscar',200,'2025-11-19 05:53:32'),
(783,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/pacientes/buscar?term=Ale',200,'2025-11-19 05:53:41'),
(784,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/pacientes/buscar?term=Alex',200,'2025-11-19 05:53:41'),
(785,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/pacientes/buscar?term=Alexi',200,'2025-11-19 05:53:41'),
(786,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/pacientes/buscar?term=Alexis',200,'2025-11-19 05:53:41'),
(787,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/pacientes/buscar?term=Alexi',200,'2025-11-19 05:53:48'),
(788,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/pacientes/buscar?term=Alex',200,'2025-11-19 05:53:48'),
(789,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/pacientes/buscar?term=Ale',200,'2025-11-19 05:53:48'),
(790,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/pacientes/buscar?term=735',200,'2025-11-19 05:53:50'),
(791,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/pacientes/buscar?term=7357',200,'2025-11-19 05:53:50'),
(792,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/pacientes/buscar?term=73576',200,'2025-11-19 05:53:50'),
(793,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/pacientes/buscar?term=7357',200,'2025-11-19 05:53:52'),
(794,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/pacientes/buscar?term=735',200,'2025-11-19 05:53:52'),
(795,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/pacientes/buscar?term=Ale',200,'2025-11-19 05:53:54'),
(796,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/pacientes/buscar?term=Alex',200,'2025-11-19 05:53:55'),
(797,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/pacientes/buscar?term=Alexi',200,'2025-11-19 05:53:57'),
(798,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/pacientes/buscar?term=Alexis',200,'2025-11-19 05:53:57'),
(799,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/expediente/2',200,'2025-11-19 05:53:59'),
(800,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/historial/buscar',200,'2025-11-19 05:54:11'),
(801,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/pacientes/buscar?term=Ale',200,'2025-11-19 05:54:13'),
(802,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/pacientes/buscar?term=Alexi',200,'2025-11-19 05:54:13'),
(803,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/pacientes/buscar?term=Alexi',200,'2025-11-19 05:54:13'),
(804,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/pacientes/buscar?term=Alexis',200,'2025-11-19 05:54:13'),
(805,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/expediente/2',200,'2025-11-19 05:54:17'),
(806,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/historial/buscar',200,'2025-11-19 05:54:26'),
(807,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/pacientes/buscar?term=Ale',200,'2025-11-19 05:55:39'),
(808,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/pacientes/buscar?term=Alex',200,'2025-11-19 05:55:40'),
(809,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/pacientes/expediente/1',200,'2025-11-19 05:55:43'),
(810,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/login',200,'2025-11-19 20:08:49'),
(811,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/dashboard',200,'2025-11-19 20:08:56'),
(812,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/historial/buscar',200,'2025-11-19 20:08:59'),
(813,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/agenda',200,'2025-11-19 20:09:03'),
(814,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','GET','/api/citas?start=2025-10-26T00%3A00%3A00-05%3A00&end=2025-12-07T00%3A00%3A00-05%3A00',200,'2025-11-19 20:09:03');
/*!40000 ALTER TABLE `access_logs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `audit_logs`
--

DROP TABLE IF EXISTS `audit_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `action` varchar(255) NOT NULL,
  `target_id` int DEFAULT NULL,
  `target_type` varchar(255) DEFAULT NULL,
  `details` text,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `audit_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `empleado` (`id_empleado`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_logs`
--

LOCK TABLES `audit_logs` WRITE;
/*!40000 ALTER TABLE `audit_logs` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `audit_logs` VALUES
(1,1,'eliminar_empleado',20,'empleado',NULL,'2025-11-13 06:03:55'),
(2,1,'enable_maintenance_mode',NULL,NULL,NULL,'2025-11-13 06:15:56'),
(3,1,'update_timezone',NULL,NULL,'{\"new_timezone\":\"UTC\"}','2025-11-13 06:44:30'),
(4,1,'update_timezone',NULL,NULL,'{\"new_timezone\":\"UTC\"}','2025-11-13 06:44:33'),
(5,1,'update_timezone',NULL,NULL,'{\"new_timezone\":\"Pacific\\/Wake\"}','2025-11-13 06:44:45'),
(6,1,'update_timezone',NULL,NULL,'{\"new_timezone\":\"Pacific\\/Pago_Pago\"}','2025-11-13 06:45:32'),
(7,1,'update_timezone',NULL,NULL,'{\"new_timezone\":\"Pacific\\/Saipan\"}','2025-11-13 06:46:09'),
(8,1,'update_timezone',NULL,NULL,'{\"new_timezone\":\"Pacific\\/Saipan\"}','2025-11-13 06:46:11'),
(9,1,'update_timezone',NULL,NULL,'{\"new_timezone\":\"UTC\"}','2025-11-13 06:56:06'),
(10,1,'disable_maintenance_mode',NULL,NULL,NULL,'2025-11-13 07:03:26'),
(11,1,'update_views',NULL,NULL,'{\"pacientes\":true,\"empleados\":true,\"agenda\":true,\"citas\":true,\"registros\":true}','2025-11-13 07:23:11'),
(12,1,'update_views',NULL,NULL,'{\"pacientes\":true,\"empleados\":false,\"agenda\":true,\"citas\":true,\"registros\":true}','2025-11-13 07:23:14'),
(13,1,'update_views',NULL,NULL,'{\"pacientes\":true,\"empleados\":true,\"agenda\":true,\"citas\":true,\"registros\":true}','2025-11-13 07:23:21'),
(14,1,'update_views',NULL,NULL,'{\"pacientes\":true,\"empleados\":false,\"agenda\":true,\"citas\":true,\"registros\":true}','2025-11-13 07:23:30'),
(15,1,'update_views',NULL,NULL,'{\"pacientes\":true,\"empleados\":true,\"agenda\":true,\"citas\":true,\"registros\":true}','2025-11-13 07:23:47'),
(16,1,'update_views',NULL,NULL,'{\"pacientes\":false,\"empleados\":true,\"agenda\":false,\"citas\":true,\"registros\":true}','2025-11-13 07:27:01'),
(17,1,'create_backup',NULL,NULL,'{\"file\":\"backup_2025-11-13_07-31-00.sql\"}','2025-11-13 07:31:00'),
(18,3,'crear_empleado',0,'empleado','{\"empleado_dni\":\"56458912\",\"empleado_nombres\":\"Luis\",\"empleado_apellidos\":\"Alejos\",\"empleado_email\":\"luis.perez@gmail.com\",\"empleado_direccion\":\"su casa\",\"empleado_telefono\":\"981475234\",\"empleado_fecha_nacimiento\":\"2001-01-04\",\"empleado_rol\":\"cajero\"}','2025-11-13 20:50:14'),
(19,1,'crear_empleado',0,'empleado','{\"empleado_dni\":\"56423819\",\"empleado_nombres\":\"Alex\",\"empleado_apellidos\":\"Ortiz\",\"empleado_email\":\"alexis322@gmail.com\",\"empleado_direccion\":\"villa\",\"empleado_telefono\":\"912456932\",\"empleado_fecha_nacimiento\":\"2010-02-05\",\"empleado_rol\":\"recepcionista\"}','2025-11-13 21:08:28'),
(20,1,'update_views',NULL,NULL,'{\"pacientes\":true,\"empleados\":true,\"agenda\":true,\"citas\":true,\"registros\":true,\"backup\":true}','2025-11-13 21:10:13'),
(21,1,'inactivar_empleado',1,'empleado',NULL,'2025-11-15 06:23:42'),
(22,1,'activar_empleado',1,'empleado',NULL,'2025-11-15 06:23:52'),
(23,1,'inactivar_empleado',5,'empleado',NULL,'2025-11-15 06:24:53'),
(24,1,'activar_empleado',5,'empleado',NULL,'2025-11-15 06:31:51');
/*!40000 ALTER TABLE `audit_logs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `caja`
--

DROP TABLE IF EXISTS `caja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `caja` (
  `id_caja` int NOT NULL AUTO_INCREMENT,
  `saldo_inicial` decimal(10,2) NOT NULL,
  `saldo_final` decimal(10,2) NOT NULL,
  `fecha_apertura` datetime DEFAULT CURRENT_TIMESTAMP,
  `fecha_cierre` datetime DEFAULT NULL,
  PRIMARY KEY (`id_caja`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caja`
--

LOCK TABLES `caja` WRITE;
/*!40000 ALTER TABLE `caja` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `caja` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `cita`
--

DROP TABLE IF EXISTS `cita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cita` (
  `id_cita` int NOT NULL AUTO_INCREMENT,
  `id_paciente` int DEFAULT NULL,
  `id_empleado_psicologo` int DEFAULT NULL,
  `fecha_hora` datetime NOT NULL,
  `motivo_consulta` text,
  `estado` enum('programada','completada','cancelada','no asistio') DEFAULT 'programada',
  PRIMARY KEY (`id_cita`),
  KEY `id_paciente` (`id_paciente`),
  KEY `id_empleado_psicologo` (`id_empleado_psicologo`),
  CONSTRAINT `cita_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`),
  CONSTRAINT `cita_ibfk_2` FOREIGN KEY (`id_empleado_psicologo`) REFERENCES `empleado` (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cita`
--

LOCK TABLES `cita` WRITE;
/*!40000 ALTER TABLE `cita` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cita` VALUES
(8,1,5,'2025-11-14 01:28:33','LOCO','programada'),
(9,1,5,'2025-11-16 02:36:15','Consulta de prueba N° 1','completada'),
(10,1,5,'2025-11-17 02:36:16','Consulta de prueba N° 2','programada'),
(11,1,5,'2025-11-18 02:36:16','Consulta de prueba N° 3','completada'),
(12,1,5,'2025-11-19 02:36:16','Consulta de prueba N° 4','completada'),
(13,1,5,'2025-11-20 02:36:16','Consulta de prueba N° 5','cancelada'),
(14,1,5,'2025-11-21 02:36:16','Consulta de prueba N° 6','completada'),
(15,1,5,'2025-11-22 02:36:16','Consulta de prueba N° 7','completada'),
(16,1,5,'2025-11-23 02:36:16','Consulta de prueba N° 8','cancelada'),
(17,1,5,'2025-11-24 02:36:16','Consulta de prueba N° 9','programada'),
(18,1,5,'2025-11-25 02:36:16','Consulta de prueba N° 10','no asistio'),
(19,1,5,'2025-11-26 02:36:16','Consulta de prueba N° 11','cancelada'),
(20,1,5,'2025-11-27 02:36:16','Consulta de prueba N° 12','completada'),
(21,1,5,'2025-11-28 02:36:16','Consulta de prueba N° 13','programada'),
(22,1,5,'2025-11-29 02:36:16','Consulta de prueba N° 14','no asistio'),
(23,1,5,'2025-11-30 02:36:16','Consulta de prueba N° 15','programada'),
(24,1,5,'2025-12-01 02:36:16','Consulta de prueba N° 16','cancelada'),
(25,1,5,'2025-12-02 02:36:16','Consulta de prueba N° 17','completada'),
(26,1,5,'2025-12-03 02:36:16','Consulta de prueba N° 18','completada'),
(27,1,5,'2025-12-04 02:36:16','Consulta de prueba N° 19','cancelada'),
(28,1,5,'2025-12-05 02:36:16','Consulta de prueba N° 20','cancelada'),
(29,1,5,'2025-12-06 02:36:16','Consulta de prueba N° 21','no asistio'),
(30,1,5,'2025-12-07 02:36:16','Consulta de prueba N° 22','completada'),
(31,1,5,'2025-12-08 02:36:16','Consulta de prueba N° 23','no asistio'),
(32,1,5,'2025-12-09 02:36:16','Consulta de prueba N° 24','no asistio'),
(33,1,5,'2025-12-10 02:36:16','Consulta de prueba N° 25','no asistio'),
(34,1,5,'2025-12-11 02:36:16','Consulta de prueba N° 26','no asistio'),
(35,1,5,'2025-12-12 02:36:16','Consulta de prueba N° 27','no asistio'),
(36,1,5,'2025-12-13 02:36:16','Consulta de prueba N° 28','cancelada'),
(37,1,5,'2025-12-14 02:36:16','Consulta de prueba N° 29','completada'),
(38,1,5,'2025-12-15 02:36:16','Consulta de prueba N° 30','programada'),
(39,1,5,'2025-12-16 02:36:16','Consulta de prueba N° 31','cancelada'),
(40,1,5,'2025-12-17 02:36:16','Consulta de prueba N° 32','completada'),
(41,1,5,'2025-12-18 02:36:16','Consulta de prueba N° 33','completada'),
(42,1,5,'2025-12-19 02:36:16','Consulta de prueba N° 34','programada'),
(43,1,5,'2025-12-20 02:36:16','Consulta de prueba N° 35','programada'),
(44,1,5,'2025-12-21 02:36:16','Consulta de prueba N° 36','no asistio'),
(45,1,5,'2025-12-22 02:36:16','Consulta de prueba N° 37','no asistio'),
(46,1,5,'2025-12-23 02:36:16','Consulta de prueba N° 38','cancelada'),
(47,1,5,'2025-12-24 02:36:16','Consulta de prueba N° 39','programada'),
(48,1,5,'2025-12-25 02:36:16','Consulta de prueba N° 40','no asistio'),
(49,1,5,'2025-12-26 02:36:16','Consulta de prueba N° 41','completada'),
(50,1,5,'2025-12-27 02:36:16','Consulta de prueba N° 42','programada'),
(51,1,5,'2025-12-28 02:36:16','Consulta de prueba N° 43','no asistio'),
(52,1,5,'2025-12-29 02:36:16','Consulta de prueba N° 44','cancelada'),
(53,1,5,'2025-12-30 02:36:16','Consulta de prueba N° 45','programada'),
(54,1,5,'2025-12-31 02:36:16','Consulta de prueba N° 46','completada'),
(55,1,5,'2026-01-01 02:36:16','Consulta de prueba N° 47','cancelada'),
(56,1,5,'2026-01-02 02:36:16','Consulta de prueba N° 48','no asistio'),
(57,1,5,'2026-01-03 02:36:16','Consulta de prueba N° 49','cancelada'),
(58,1,5,'2026-01-04 02:36:16','Consulta de prueba N° 50','completada'),
(59,1,5,'2026-01-05 02:36:16','Consulta de prueba N° 51','programada'),
(60,1,5,'2026-01-06 02:36:16','Consulta de prueba N° 52','no asistio'),
(61,1,5,'2026-01-07 02:36:16','Consulta de prueba N° 53','completada'),
(62,1,5,'2026-01-08 02:36:16','Consulta de prueba N° 54','completada'),
(63,1,5,'2026-01-09 02:36:16','Consulta de prueba N° 55','completada'),
(64,1,5,'2026-01-10 02:36:16','Consulta de prueba N° 56','completada'),
(65,1,5,'2026-01-11 02:36:16','Consulta de prueba N° 57','cancelada'),
(66,1,5,'2026-01-12 02:36:16','Consulta de prueba N° 58','completada'),
(67,1,5,'2026-01-13 02:36:16','Consulta de prueba N° 59','cancelada'),
(68,1,5,'2026-01-14 02:36:16','Consulta de prueba N° 60','no asistio'),
(69,1,5,'2026-01-15 02:36:16','Consulta de prueba N° 61','programada'),
(70,1,5,'2026-01-16 02:36:16','Consulta de prueba N° 62','cancelada'),
(71,1,5,'2026-01-17 02:36:16','Consulta de prueba N° 63','completada'),
(72,1,5,'2026-01-18 02:36:16','Consulta de prueba N° 64','cancelada'),
(73,1,5,'2026-01-19 02:36:16','Consulta de prueba N° 65','completada'),
(74,1,5,'2026-01-20 02:36:16','Consulta de prueba N° 66','completada'),
(75,1,5,'2026-01-21 02:36:16','Consulta de prueba N° 67','programada'),
(76,1,5,'2026-01-22 02:36:16','Consulta de prueba N° 68','programada'),
(77,1,5,'2026-01-23 02:36:16','Consulta de prueba N° 69','no asistio'),
(78,1,5,'2026-01-24 02:36:16','Consulta de prueba N° 70','programada'),
(79,1,5,'2026-01-25 02:36:16','Consulta de prueba N° 71','programada'),
(80,1,5,'2026-01-26 02:36:16','Consulta de prueba N° 72','no asistio'),
(81,1,5,'2026-01-27 02:36:16','Consulta de prueba N° 73','cancelada'),
(82,1,5,'2026-01-28 02:36:16','Consulta de prueba N° 74','completada'),
(83,1,5,'2026-01-29 02:36:16','Consulta de prueba N° 75','no asistio'),
(84,1,5,'2026-01-30 02:36:16','Consulta de prueba N° 76','no asistio'),
(85,1,5,'2026-01-31 02:36:16','Consulta de prueba N° 77','programada'),
(86,1,5,'2026-02-01 02:36:16','Consulta de prueba N° 78','cancelada'),
(87,1,5,'2026-02-02 02:36:16','Consulta de prueba N° 79','completada'),
(88,1,5,'2026-02-03 02:36:16','Consulta de prueba N° 80','cancelada'),
(89,1,5,'2026-02-04 02:36:16','Consulta de prueba N° 81','programada'),
(90,1,5,'2026-02-05 02:36:16','Consulta de prueba N° 82','completada'),
(91,1,5,'2026-02-06 02:36:16','Consulta de prueba N° 83','programada'),
(92,1,5,'2026-02-07 02:36:16','Consulta de prueba N° 84','programada'),
(93,1,5,'2026-02-08 02:36:16','Consulta de prueba N° 85','completada'),
(94,1,5,'2026-02-09 02:36:16','Consulta de prueba N° 86','no asistio'),
(95,1,5,'2026-02-10 02:36:16','Consulta de prueba N° 87','programada'),
(96,1,5,'2026-02-11 02:36:16','Consulta de prueba N° 88','completada'),
(97,1,5,'2026-02-12 02:36:16','Consulta de prueba N° 89','completada'),
(98,1,5,'2026-02-13 02:36:16','Consulta de prueba N° 90','programada'),
(99,1,5,'2026-02-14 02:36:16','Consulta de prueba N° 91','no asistio'),
(100,1,5,'2026-02-15 02:36:16','Consulta de prueba N° 92','programada'),
(101,1,5,'2026-02-16 02:36:16','Consulta de prueba N° 93','cancelada'),
(102,1,5,'2026-02-17 02:36:16','Consulta de prueba N° 94','no asistio'),
(103,1,5,'2026-02-18 02:36:16','Consulta de prueba N° 95','no asistio'),
(104,1,5,'2026-02-19 02:36:16','Consulta de prueba N° 96','programada'),
(105,1,5,'2026-02-20 02:36:16','Consulta de prueba N° 97','no asistio'),
(106,1,5,'2026-02-21 02:36:16','Consulta de prueba N° 98','no asistio'),
(107,1,5,'2026-02-22 02:36:16','Consulta de prueba N° 99','cancelada'),
(108,1,5,'2026-02-23 02:36:16','Consulta de prueba N° 100','cancelada');
/*!40000 ALTER TABLE `cita` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `id_persona` int DEFAULT NULL,
  `tipo` enum('natural','juridica') NOT NULL,
  `razon_social` varchar(200) DEFAULT NULL,
  `ruc` char(11) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `activo` tinyint(1) DEFAULT '1',
  `representante_legal` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `ruc` (`ruc`),
  KEY `id_persona` (`id_persona`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cliente` VALUES
(1,29,'natural',NULL,NULL,'2025-11-13 23:01:34',1,NULL),
(2,NULL,'juridica','Anonimous S.A.C','10735767629','2025-11-14 01:12:02',1,NULL);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `comprobante_pago`
--

DROP TABLE IF EXISTS `comprobante_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `comprobante_pago` (
  `id_comprobante_pago` int NOT NULL AUTO_INCREMENT,
  `id_pago` int DEFAULT NULL,
  `numero_comprobante_pago` varchar(20) NOT NULL,
  `numero_serie` varchar(20) NOT NULL,
  `fecha_emision` datetime DEFAULT CURRENT_TIMESTAMP,
  `tipo` enum('boleta','factura') DEFAULT NULL,
  `estado` enum('emitida','anulada') DEFAULT 'emitida',
  PRIMARY KEY (`id_comprobante_pago`),
  UNIQUE KEY `numero_comprobante_pago` (`numero_comprobante_pago`),
  KEY `id_pago` (`id_pago`),
  CONSTRAINT `comprobante_pago_ibfk_1` FOREIGN KEY (`id_pago`) REFERENCES `pago` (`id_pago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprobante_pago`
--

LOCK TABLES `comprobante_pago` WRITE;
/*!40000 ALTER TABLE `comprobante_pago` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `comprobante_pago` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `consulta`
--

DROP TABLE IF EXISTS `consulta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `consulta` (
  `id_consulta` int NOT NULL AUTO_INCREMENT,
  `id_diagnostico` int DEFAULT NULL,
  `duracion_minuto` int NOT NULL,
  `id_cita` int NOT NULL,
  PRIMARY KEY (`id_consulta`),
  UNIQUE KEY `uq_consulta_cita` (`id_cita`),
  KEY `id_diagnostico` (`id_diagnostico`),
  CONSTRAINT `consulta_ibfk_1` FOREIGN KEY (`id_diagnostico`) REFERENCES `diagnostico` (`id_diagnostico`),
  CONSTRAINT `fk_consulta_cita` FOREIGN KEY (`id_cita`) REFERENCES `cita` (`id_cita`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consulta`
--

LOCK TABLES `consulta` WRITE;
/*!40000 ALTER TABLE `consulta` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `consulta` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `diagnostico`
--

DROP TABLE IF EXISTS `diagnostico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnostico` (
  `id_diagnostico` int NOT NULL AUTO_INCREMENT,
  `id_cita` int DEFAULT NULL,
  `id_historial` int DEFAULT NULL,
  `codigo_diagnostico` varchar(20) NOT NULL,
  `descripcion` text,
  `fecha` date NOT NULL,
  `severidad` enum('leve','moderado','grave') NOT NULL,
  `estado` enum('activo','resuelto','pendiente') DEFAULT 'activo',
  PRIMARY KEY (`id_diagnostico`),
  UNIQUE KEY `codigo_diagnostico` (`codigo_diagnostico`),
  KEY `id_cita` (`id_cita`),
  KEY `id_historial` (`id_historial`),
  CONSTRAINT `diagnostico_ibfk_1` FOREIGN KEY (`id_cita`) REFERENCES `cita` (`id_cita`),
  CONSTRAINT `diagnostico_ibfk_2` FOREIGN KEY (`id_historial`) REFERENCES `historial_clinico` (`id_historial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnostico`
--

LOCK TABLES `diagnostico` WRITE;
/*!40000 ALTER TABLE `diagnostico` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `diagnostico` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `id_persona` int DEFAULT NULL,
  `rol` enum('psicologo','recepcionista','cajero','administrador') NOT NULL,
  `colegiatura` varchar(50) DEFAULT NULL,
  `especialidad` varchar(100) DEFAULT NULL,
  `usuario` varchar(50) NOT NULL,
  `clave` varchar(255) NOT NULL,
  `intentos_fallidos` int DEFAULT '0',
  `bloqueado_hasta` datetime DEFAULT NULL,
  `last_activity` datetime DEFAULT NULL,
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `estado` varchar(255) NOT NULL DEFAULT 'activo',
  PRIMARY KEY (`id_empleado`),
  UNIQUE KEY `usuario` (`usuario`),
  KEY `id_persona` (`id_persona`),
  CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `empleado` VALUES
(1,1,'administrador',NULL,NULL,'alex322r','$2y$12$3G3THM5vrSUEPq1niGras.r0Eb3wPxkSfeUoaU5Tb5q28aEiRnd5K',0,NULL,'2025-11-15 07:10:13','2025-11-12 07:10:21','activo'),
(3,NULL,'administrador',NULL,NULL,'luis.alejos','$2y$12$p0DQfhUZzMGOawVQ1EOTPO9DLS9I4Q1r/Zs1c357kplUGwyNFavqq',0,NULL,'2025-11-19 04:27:36','2025-11-12 07:10:21','activo'),
(4,NULL,'recepcionista',NULL,NULL,'william','$2y$12$VDfCNMLzASEKI6YtdnBUwOsPN.tv6G/Pai4WSXxE4XkZbRy7xQqee',0,NULL,'2025-11-19 04:27:23','2025-11-12 07:10:21','activo'),
(5,25,'psicologo',NULL,NULL,'alexis','$2y$12$IY0uXabVCcHqfgvrlkxgG..4/odvHwP2dzcu0GiYuZUNn2Y5UEK6m',0,NULL,'2025-11-19 20:09:03','2025-11-12 07:10:21','activo'),
(21,27,'cajero',NULL,NULL,'user27','$2y$12$VnuW81R8K01gtlEMqYvLRO8AN1Wphn7g9QKbuFN1qmHY.Duu34dQy',0,NULL,'2025-11-13 21:07:12','2025-11-13 20:50:14','activo'),
(22,28,'recepcionista',NULL,NULL,'user28','$2y$12$4UoGC6.VetQwwIEjEaoFeejqCQMe8RsWZc2D15CvocvF3zMqDGEfK',3,NULL,'2025-11-15 01:33:10','2025-11-13 21:08:28','activo');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `historial_clinico`
--

DROP TABLE IF EXISTS `historial_clinico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_clinico` (
  `id_historial` int NOT NULL AUTO_INCREMENT,
  `id_paciente` int DEFAULT NULL,
  `antecedentes_medicos` text,
  `plan_terapeutico` text,
  PRIMARY KEY (`id_historial`),
  KEY `id_paciente` (`id_paciente`),
  CONSTRAINT `historial_clinico_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_clinico`
--

LOCK TABLES `historial_clinico` WRITE;
/*!40000 ALTER TABLE `historial_clinico` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `historial_clinico` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `intentos_login_fallidos`
--

DROP TABLE IF EXISTS `intentos_login_fallidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `intentos_login_fallidos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) NOT NULL,
  `ip` varchar(45) NOT NULL,
  `fecha_intento` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intentos_login_fallidos`
--

LOCK TABLES `intentos_login_fallidos` WRITE;
/*!40000 ALTER TABLE `intentos_login_fallidos` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `intentos_login_fallidos` VALUES
(1,'user26','::1','2025-11-13 04:20:39'),
(2,'user28','127.0.0.1','2025-11-15 01:49:46'),
(3,'user28','127.0.0.1','2025-11-15 03:05:11'),
(4,'william','127.0.0.1','2025-11-15 03:09:22'),
(5,'luis','127.0.0.1','2025-11-15 03:20:07'),
(6,'user28','127.0.0.1','2025-11-19 04:27:44');
/*!40000 ALTER TABLE `intentos_login_fallidos` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `mensaje`
--

DROP TABLE IF EXISTS `mensaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mensaje` (
  `id_mensaje` int NOT NULL AUTO_INCREMENT,
  `id_emisor` int DEFAULT NULL,
  `id_receptor` int DEFAULT NULL,
  `contenido` varchar(256) DEFAULT NULL,
  `fecha_envio` datetime DEFAULT NULL,
  `leido` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_mensaje`),
  KEY `id_emisor` (`id_emisor`),
  KEY `id_receptor` (`id_receptor`),
  CONSTRAINT `mensaje_ibfk_1` FOREIGN KEY (`id_emisor`) REFERENCES `empleado` (`id_empleado`),
  CONSTRAINT `mensaje_ibfk_2` FOREIGN KEY (`id_receptor`) REFERENCES `empleado` (`id_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensaje`
--

LOCK TABLES `mensaje` WRITE;
/*!40000 ALTER TABLE `mensaje` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `mensaje` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `metodo_pago`
--

DROP TABLE IF EXISTS `metodo_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodo_pago` (
  `id_metodo_pago` int NOT NULL AUTO_INCREMENT,
  `tipo` enum('efectivo','tarjeta','transferencia','billetera digital') NOT NULL,
  PRIMARY KEY (`id_metodo_pago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodo_pago`
--

LOCK TABLES `metodo_pago` WRITE;
/*!40000 ALTER TABLE `metodo_pago` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `metodo_pago` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente` (
  `id_paciente` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `id_persona` int NOT NULL,
  `estado` enum('en tratamiento','alta','suspendido') DEFAULT 'en tratamiento',
  PRIMARY KEY (`id_paciente`),
  KEY `id_cliente` (`id_cliente`),
  KEY `paciente_persona_FK` (`id_persona`),
  CONSTRAINT `paciente_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `paciente_persona_FK` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `paciente` VALUES
(1,1,29,'en tratamiento'),
(2,2,1,'en tratamiento'),
(3,1,30,'en tratamiento');
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `paciente_seguro`
--

DROP TABLE IF EXISTS `paciente_seguro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente_seguro` (
  `id_paciente_seguro` int NOT NULL AUTO_INCREMENT,
  `id_paciente` int DEFAULT NULL,
  `id_seguro` int DEFAULT NULL,
  `numero_poliza` varchar(50) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  `activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_paciente_seguro`),
  UNIQUE KEY `numero_poliza` (`numero_poliza`),
  KEY `id_paciente` (`id_paciente`),
  KEY `id_seguro` (`id_seguro`),
  CONSTRAINT `paciente_seguro_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`),
  CONSTRAINT `paciente_seguro_ibfk_2` FOREIGN KEY (`id_seguro`) REFERENCES `seguro` (`id_seguro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente_seguro`
--

LOCK TABLES `paciente_seguro` WRITE;
/*!40000 ALTER TABLE `paciente_seguro` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `paciente_seguro` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago` (
  `id_pago` int NOT NULL AUTO_INCREMENT,
  `id_cita` int DEFAULT NULL,
  `id_plan_paciente` int DEFAULT NULL,
  `id_metodo_pago` int DEFAULT NULL,
  `monto` decimal(10,2) NOT NULL,
  `monto_cubierto_seguro` decimal(10,2) DEFAULT '0.00',
  `monto_pagado_paciente` decimal(10,2) NOT NULL,
  `fecha_pago` datetime DEFAULT CURRENT_TIMESTAMP,
  `estado` enum('pendiente','completado','cancelado') DEFAULT 'pendiente',
  PRIMARY KEY (`id_pago`),
  KEY `id_cita` (`id_cita`),
  KEY `id_plan_paciente` (`id_plan_paciente`),
  KEY `id_metodo_pago` (`id_metodo_pago`),
  CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`id_cita`) REFERENCES `cita` (`id_cita`),
  CONSTRAINT `pago_ibfk_2` FOREIGN KEY (`id_plan_paciente`) REFERENCES `plan_paciente` (`id_plan_paciente`),
  CONSTRAINT `pago_ibfk_3` FOREIGN KEY (`id_metodo_pago`) REFERENCES `metodo_pago` (`id_metodo_pago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `id_persona` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `dni` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  PRIMARY KEY (`id_persona`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `dni` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `persona` VALUES
(1,'Alexis','Rodriguez','73576762','alexisroor@gmail.com','mi casa','930937991',NULL),
(25,'Alexos','Ortiz','89901235','alexisroor322@gmail.com','garatea mz 4 lt 12','912567654','1999-01-05'),
(27,'Luis','Alejos','56458912','luis.perez@gmail.com','su casa','981475234','2001-01-04'),
(28,'Alex','Ortiz','56423819','alexis322@gmail.com','villa','912456932','2010-02-05'),
(29,'Alex','Alejos','56981243','alexAlej32@gmail.com',NULL,NULL,NULL),
(30,'Pedro','Ramirez','56981242','pedrorami@gmail.com',NULL,NULL,NULL);
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `plan`
--

DROP TABLE IF EXISTS `plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan` (
  `id_plan` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text,
  `numero_sesiones` int NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `descuento` decimal(5,2) DEFAULT '0.00',
  `duracion_meses` int NOT NULL,
  `activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_plan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan`
--

LOCK TABLES `plan` WRITE;
/*!40000 ALTER TABLE `plan` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `plan` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `plan_paciente`
--

DROP TABLE IF EXISTS `plan_paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_paciente` (
  `id_plan_paciente` int NOT NULL AUTO_INCREMENT,
  `id_plan` int DEFAULT NULL,
  `id_paciente` int DEFAULT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  `vigente` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_plan_paciente`),
  KEY `id_plan` (`id_plan`),
  KEY `id_paciente` (`id_paciente`),
  CONSTRAINT `plan_paciente_ibfk_1` FOREIGN KEY (`id_plan`) REFERENCES `plan` (`id_plan`),
  CONSTRAINT `plan_paciente_ibfk_2` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_paciente`
--

LOCK TABLES `plan_paciente` WRITE;
/*!40000 ALTER TABLE `plan_paciente` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `plan_paciente` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `recordatorio`
--

DROP TABLE IF EXISTS `recordatorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `recordatorio` (
  `id_recordatorio` int NOT NULL AUTO_INCREMENT,
  `id_cita` int DEFAULT NULL,
  `mensaje` text,
  `fecha` datetime DEFAULT NULL,
  `medio` enum('email','sms','whatsApp') DEFAULT NULL,
  `estado` enum('pendiente','enviado') DEFAULT NULL,
  PRIMARY KEY (`id_recordatorio`),
  KEY `id_cita` (`id_cita`),
  CONSTRAINT `recordatorio_ibfk_1` FOREIGN KEY (`id_cita`) REFERENCES `cita` (`id_cita`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recordatorio`
--

LOCK TABLES `recordatorio` WRITE;
/*!40000 ALTER TABLE `recordatorio` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `recordatorio` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `recurso`
--

DROP TABLE IF EXISTS `recurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `recurso` (
  `id_recurso` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) DEFAULT NULL,
  `tipo` enum('prueba','material','libro','otro') DEFAULT NULL,
  `cantidad_total` int DEFAULT NULL,
  `cantidad_disponible` int DEFAULT NULL,
  PRIMARY KEY (`id_recurso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recurso`
--

LOCK TABLES `recurso` WRITE;
/*!40000 ALTER TABLE `recurso` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `recurso` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `seguro`
--

DROP TABLE IF EXISTS `seguro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguro` (
  `id_seguro` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text,
  `cobertura` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id_seguro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seguro`
--

LOCK TABLES `seguro` WRITE;
/*!40000 ALTER TABLE `seguro` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `seguro` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `transaccion`
--

DROP TABLE IF EXISTS `transaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaccion` (
  `id_transaccion` int NOT NULL AUTO_INCREMENT,
  `id_caja` int DEFAULT NULL,
  `id_pago` int DEFAULT NULL,
  `tipo` enum('ingreso','egreso') NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_transaccion`),
  KEY `id_caja` (`id_caja`),
  KEY `id_pago` (`id_pago`),
  CONSTRAINT `transaccion_ibfk_1` FOREIGN KEY (`id_caja`) REFERENCES `caja` (`id_caja`),
  CONSTRAINT `transaccion_ibfk_2` FOREIGN KEY (`id_pago`) REFERENCES `pago` (`id_pago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaccion`
--

LOCK TABLES `transaccion` WRITE;
/*!40000 ALTER TABLE `transaccion` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `transaccion` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `tratamiento`
--

DROP TABLE IF EXISTS `tratamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tratamiento` (
  `id_tratamiento` int NOT NULL AUTO_INCREMENT,
  `id_diagnostico` int DEFAULT NULL,
  `descripcion` text NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  `estado` enum('activo','completado','suspendido') DEFAULT 'activo',
  PRIMARY KEY (`id_tratamiento`),
  KEY `id_diagnostico` (`id_diagnostico`),
  CONSTRAINT `tratamiento_ibfk_1` FOREIGN KEY (`id_diagnostico`) REFERENCES `diagnostico` (`id_diagnostico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tratamiento`
--

LOCK TABLES `tratamiento` WRITE;
/*!40000 ALTER TABLE `tratamiento` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tratamiento` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `uso_recurso`
--

DROP TABLE IF EXISTS `uso_recurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `uso_recurso` (
  `id_uso_recurso` int NOT NULL AUTO_INCREMENT,
  `id_recurso` int DEFAULT NULL,
  `id_cita` int DEFAULT NULL,
  `cantidad_usada` int DEFAULT NULL,
  `observaciones` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_uso_recurso`),
  KEY `id_recurso` (`id_recurso`),
  KEY `id_cita` (`id_cita`),
  CONSTRAINT `uso_recurso_ibfk_1` FOREIGN KEY (`id_recurso`) REFERENCES `recurso` (`id_recurso`),
  CONSTRAINT `uso_recurso_ibfk_2` FOREIGN KEY (`id_cita`) REFERENCES `cita` (`id_cita`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uso_recurso`
--

LOCK TABLES `uso_recurso` WRITE;
/*!40000 ALTER TABLE `uso_recurso` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `uso_recurso` ENABLE KEYS */;
UNLOCK TABLES;
commit;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-11-19 22:46:23
