/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.5.29-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: bank_db
-- ------------------------------------------------------
-- Server version	10.5.29-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_number` varchar(20) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `balance` decimal(10,2) DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_number` (`account_number`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'ACC1001','Tino',14500.00,'2026-04-13 18:54:29'),(2,'ACC1002','Deji',11500.00,'2026-04-13 18:56:29'),(3,'ACC1050','Seyi',6000.00,'2026-04-13 18:56:56'),(5,'ACC1150','Daniella',4000.00,'2026-04-13 18:58:08'),(6,'ACC1250','James',5500.00,'2026-04-13 18:58:32'),(7,'ACC1430','Jim',6000.00,'2026-04-13 18:58:59'),(8,'ACC6270','Lekan Maxwell',4500.00,'2026-04-14 08:20:10');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_number` varchar(20) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,'ACC1150','deposit',2000.00,'2026-04-13 19:03:39'),(2,'ACC1001','deposit',1000.00,'2026-04-13 19:17:19'),(3,'ACC1001','transfer_out',500.00,'2026-04-13 19:21:24'),(4,'ACC1002','transfer_in',500.00,'2026-04-13 19:21:24'),(5,'ACC1001','transfer_out',500.00,'2026-04-13 19:34:59'),(6,'ACC1002','transfer_in',500.00,'2026-04-13 19:34:59'),(7,'ACC6270','deposit',8000.00,'2026-04-14 08:27:12'),(8,'ACC1001','withdrawal',6000.00,'2026-04-14 08:44:57'),(9,'ACC1250','transfer_out',3500.00,'2026-04-14 08:51:58'),(10,'ACC1001','transfer_in',3500.00,'2026-04-14 08:51:58'),(11,'ACC1001','deposit',2000.00,'2026-04-14 16:31:37'),(12,'acc1001','deposit',2000.00,'2026-04-14 16:38:02'),(13,'ACC1001','deposit',2000.00,'2026-04-14 16:43:19'),(14,'ACC1001','deposit',2000.00,'2026-04-14 16:48:54'),(15,'ACC1001','deposit',200.00,'2026-04-14 16:54:51'),(16,'ACC1001','deposit',2300.00,'2026-04-14 17:02:06'),(17,'ACC1430','withdrawal',4000.00,'2026-04-14 17:11:08'),(18,'ACC6270','withdrawal',3000.00,'2026-04-14 17:26:56'),(19,'ACC1430','transfer_out',4000.00,'2026-04-14 17:29:14'),(20,'ACC1050','transfer_in',4000.00,'2026-04-14 17:29:14'),(21,'ACC6270','transfer_out',500.00,'2026-04-14 17:46:21'),(22,'ACC1002','transfer_in',500.00,'2026-04-14 17:46:21');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-15 13:34:18
