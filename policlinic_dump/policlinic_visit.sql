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
-- Table structure for table `visit`
--

DROP TABLE IF EXISTS `visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visit` (
  `visit_id` int NOT NULL AUTO_INCREMENT,
  `visit_date` date NOT NULL,
  `diagnosis` varchar(45) DEFAULT NULL,
  `complaints` varchar(45) DEFAULT NULL,
  `prescription` varchar(45) DEFAULT NULL,
  `docs_visit` int NOT NULL,
  `card_visit` int NOT NULL,
  PRIMARY KEY (`visit_id`),
  KEY `docs_visit_idx` (`docs_visit`),
  KEY `card_visit_idx` (`card_visit`),
  CONSTRAINT `card_visit` FOREIGN KEY (`card_visit`) REFERENCES `patient` (`card_number`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `docs_visit` FOREIGN KEY (`docs_visit`) REFERENCES `doctor` (`doc_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit`
--

LOCK TABLES `visit` WRITE;
/*!40000 ALTER TABLE `visit` DISABLE KEYS */;
INSERT INTO `visit` VALUES (1,'2023-02-01','кариес','болят зубы','пломба',1,1),(49,'2023-02-13','грипп','температура','чай с лимоном',4,6),(61,'2023-02-13','грипп','температура','чай с лимоном',3,1),(62,'2023-02-12','орви','температура','чай с медом',2,2),(63,'2023-02-01','орви','температура','чай с медом',1,1),(64,'2023-12-22','аппендицит','боль в животе','операция',2,7),(74,'2023-12-22','аппендицит','боль в животе','операция',13,1),(76,'2023-12-23',NULL,NULL,NULL,13,1),(77,'2023-12-22',NULL,NULL,NULL,2,7),(80,'2023-03-01','ангина','температура','антибиотики',1,1),(81,'2023-03-01','ангина','температура','антибиотики',2,1),(82,'2023-03-03','кисты в яичниках','отсутствуют','таблетки',3,3),(83,'2023-03-04','кисты в яичниках','отсутствуют','таблетки',3,4),(84,'2023-03-12','депрессия','апатия','антидепрессанты',22,15),(85,'2023-12-23',NULL,NULL,NULL,4,1),(86,'2023-12-26',NULL,NULL,NULL,13,20),(87,'2023-12-24',NULL,NULL,NULL,18,20),(88,'2023-02-01',NULL,NULL,NULL,1,1),(89,'2023-02-12',NULL,NULL,NULL,2,2),(90,'2023-02-13',NULL,NULL,NULL,1,4),(91,'2023-12-24',NULL,NULL,NULL,19,20),(92,'2023-12-24',NULL,NULL,NULL,19,20);
/*!40000 ALTER TABLE `visit` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-10 13:45:26
