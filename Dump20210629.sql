-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: auction
-- ------------------------------------------------------
-- Server version	8.0.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bids`
--

DROP TABLE IF EXISTS `bids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bids` (
  `bid_id` int NOT NULL AUTO_INCREMENT,
  `bid_date` date DEFAULT NULL,
  `bid_value` double DEFAULT NULL,
  `items_item_id` int DEFAULT NULL,
  `users_user_id` int DEFAULT NULL,
  PRIMARY KEY (`bid_id`),
  UNIQUE KEY `bid_id_UNIQUE` (`bid_id`),
  KEY `users_to_bids_idx` (`users_user_id`),
  KEY `items_to_bids_idx` (`items_item_id`),
  CONSTRAINT `items_to_bids` FOREIGN KEY (`items_item_id`) REFERENCES `items` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `users_to_bids` FOREIGN KEY (`users_user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bids`
--

LOCK TABLES `bids` WRITE;
/*!40000 ALTER TABLE `bids` DISABLE KEYS */;
INSERT INTO `bids` VALUES (1,'2021-12-06',10000,1001,100),(2,'2021-02-15',5000,1003,102),(3,'2020-12-03',2220,1015,101),(4,'2021-08-10',2220,1015,109),(5,'2020-09-02',5000,1002,100),(6,'2021-03-08',3000,1004,108),(7,'2021-02-19',1460,1014,105),(8,'2021-03-21',3440,1013,102),(9,'2021-06-22',2350,1007,103),(10,'2021-08-02',4700,1008,107),(11,'2021-09-12',1200,1005,100),(12,'2021-09-22',1200,1005,104),(13,'2021-07-03',6500,1006,106),(14,'2020-08-29',1000000,1009,105),(15,'2020-12-24',4950,1011,104),(16,'2022-02-13',3030,1010,109),(17,'2021-04-25',2330,1012,108),(18,'2021-04-26',2350,1012,100),(19,'2021-06-01',3000,1012,107),(20,'2021-01-02',15000,1002,106);
/*!40000 ALTER TABLE `bids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(20) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `start_price` double DEFAULT NULL,
  `bid_increment` double DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `stop_date` date DEFAULT NULL,
  `buy_it_now` binary(1) DEFAULT NULL,
  `users_user_id` int DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `item_id_UNIQUE` (`item_id`),
  KEY `users_to_items_idx` (`users_user_id`),
  CONSTRAINT `users_to_items` FOREIGN KEY (`users_user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1020 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1001,'Sword','a weapon with a long metal blade and a hilt',406821,1820,'2021-12-05','2022-05-31',NULL,108),(1002,'Katana','japanese sword',847823,5000,'2020-07-02','2021-05-17',NULL,107),(1003,'Hammer','a tool with a heavy metal head',790048,4550,'2021-01-15','2021-05-27',NULL,100),(1004,'Uzi','a type of submachine gun of Israeli design',34366,2980,'2021-02-11','2021-07-29',NULL,100),(1005,'Magic Stick','wizard staff',691221,1190,'2021-07-22','2021-09-30',NULL,101),(1006,'Grenade Launcher','a weapon which throws grenades',871290,4770,'2020-12-03','2022-02-10',NULL,103),(1007,'Sniper Rifle','a weapon which provides very high accuracy',681811,2300,'2021-04-22','2021-12-12',NULL,102),(1008,'Trebuchet','a medieval siege machine for hurling large stones',543498,4650,'2020-08-02','2022-02-05',NULL,105),(1009,'Nuclear Weapon','a bomb or missile that uses nuclear energy',6493,4040,'2020-08-28','2020-12-23',NULL,107),(1010,'Rapier','a thin, light sharp-pointed sword used for thrusting',833679,3030,'2021-07-07','2022-03-13',NULL,104),(1011,'Knife','an instrument composed of a blade fixed into a handle',219320,4930,'2020-11-24','2022-03-14',NULL,106),(1012,'Dagger','a knife with a pointed and edged blade',2236272,2330,'2021-03-25','2021-06-03',NULL,109),(1013,'Glaive','polearm with a single-edged blade',10008992,3440,'2021-03-20','2021-07-25',NULL,109),(1014,'Lance','a long weapon with a wooden shaft and a pointed steel head',13677616,1460,'2021-02-19','2022-02-04',NULL,109),(1015,'Spear','a weapon with a long shaft and a pointed tip for throwing',692739,2220,'2020-11-03','2021-09-10',NULL,100);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(45) DEFAULT NULL,
  `billing_address` varchar(100) DEFAULT NULL,
  `login` varchar(20) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  UNIQUE KEY `login_UNIQUE` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'full_name','billing_address','login','password'),(100,'Charles Logan','Tunisia','nibh','HallaHoward'),(101,'Jessamine Nieves','USA','Etiam','BlairChaney'),(102,'Gareth Todd','France','gravida','GenevieveAlford'),(103,'Christopher Hodges','Israel','felis','AphroditeMarks'),(104,'Lilah Campbell','Oman','sit','LindaDunlap'),(105,'Alana Patel','France','amet','TanishaGarza'),(106,'Aimee Mcneil','Armenia','rutrum','JoyTaylor'),(107,'Meghan Peterson','Russia','magna','AudraHester'),(108,'Steel Mcneil','USA','convallis','TanaDavid'),(109,'Wing Coleman','Tunisia','diam','CamillaGomez'),(110,NULL,NULL,NULL,NULL),(111,NULL,NULL,NULL,NULL),(112,NULL,NULL,NULL,NULL),(113,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-29  1:26:37
