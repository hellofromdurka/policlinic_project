-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: policlinic
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `timetable`
--

DROP TABLE IF EXISTS `timetable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timetable` (
  `timetable_id` int NOT NULL AUTO_INCREMENT,
  `appointment_date` date NOT NULL,
  `appointment_time` time NOT NULL,
  `appearance` int DEFAULT NULL,
  `appointment_doctor` int NOT NULL,
  `appointment_patient` int DEFAULT NULL,
  `appointment_room` int NOT NULL,
  PRIMARY KEY (`timetable_id`),
  KEY `appointment_doctor_idx` (`appointment_doctor`),
  KEY `appointment_patient_idx` (`appointment_patient`),
  KEY `appointment_room_idx` (`appointment_room`),
  CONSTRAINT `appointment_doctor` FOREIGN KEY (`appointment_doctor`) REFERENCES `doctor` (`doc_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `appointment_patient` FOREIGN KEY (`appointment_patient`) REFERENCES `patient` (`card_number`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `appointment_room` FOREIGN KEY (`appointment_room`) REFERENCES `room` (`room_number`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable`
--

LOCK TABLES `timetable` WRITE;
/*!40000 ALTER TABLE `timetable` DISABLE KEYS */;
INSERT INTO `timetable` VALUES (1,'2023-02-01','17:00:00',1,1,1,1),(2,'2023-02-12','15:00:00',1,2,2,2),(8,'2023-02-13','15:00:00',1,1,4,3),(9,'2023-02-13','17:00:00',1,4,6,2),(10,'2023-02-13','16:00:00',1,3,1,4),(11,'2023-11-30','15:00:00',1,2,5,1),(18,'2023-12-22','13:00:00',1,2,7,2),(19,'2023-12-23','12:00:00',1,4,1,3),(32,'2023-12-23','11:00:00',NULL,4,2,5),(126,'2023-03-01','09:00:00',1,1,1,4),(147,'2023-03-01','10:00:00',1,2,1,2),(148,'2023-03-03','11:00:00',1,3,3,6),(149,'2023-03-04','12:00:00',1,3,4,4),(154,'2023-03-04','11:00:00',1,1,2,2),(155,'2023-03-12','10:00:00',1,22,15,6),(156,'2023-03-09','17:00:00',1,9,1,3),(157,'2023-03-10','18:00:00',1,15,8,4),(158,'2023-03-11','19:00:00',1,1,11,4),(159,'2023-03-12','20:00:00',1,12,3,1),(160,'2023-03-13','21:00:00',1,10,13,6),(161,'2023-03-15','16:00:00',1,10,15,1),(162,'2023-12-20','11:00:00',NULL,12,3,3),(163,'2023-12-20','15:00:00',NULL,4,6,1),(164,'2023-12-11','12:00:00',NULL,1,4,3),(165,'2023-12-11','13:00:00',NULL,1,1,3),(166,'2023-12-11','14:00:00',NULL,1,3,3),(167,'2023-12-11','13:00:00',NULL,2,2,2),(168,'2023-12-22','12:00:00',NULL,1,1,3),(169,'2023-12-22','13:00:00',NULL,1,1,3),(170,'2023-12-22','13:00:00',NULL,13,1,3),(171,'2023-12-23','12:00:00',NULL,13,1,4),(172,'2023-12-23','13:00:00',NULL,13,1,5),(173,'2023-12-24','11:00:00',NULL,13,1,2),(174,'2023-12-26','10:00:00',NULL,13,20,1),(185,'2023-12-24','15:00:00',NULL,19,20,6),(186,'2023-12-24','16:00:00',NULL,12,NULL,1),(187,'2023-12-24','17:00:00',NULL,18,20,4),(188,'2023-12-27','18:00:00',NULL,11,NULL,2),(189,'2023-12-27','19:00:00',NULL,13,NULL,1),(195,'2023-04-13','17:00:00',1,15,10,6),(196,'2023-04-13','16:00:00',1,3,1,1),(197,'2023-04-30','15:00:00',1,8,5,4),(198,'2023-04-22','13:00:00',1,9,7,2),(199,'2023-04-23','12:00:00',1,8,1,3);
/*!40000 ALTER TABLE `timetable` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-10 13:45:27
