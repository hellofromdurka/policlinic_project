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
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `card_number` int NOT NULL,
  `patient_passport` varchar(45) NOT NULL,
  `patient_address` varchar(45) NOT NULL,
  `birthday` date NOT NULL,
  `card_creation_date` date NOT NULL,
  PRIMARY KEY (`card_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'Коньков','ул. Победы','2001-03-21','2010-04-12'),(2,'Устинов','ул. Комсомольская','2002-10-09','2012-11-15'),(3,'Попова','ул. Ленина','2000-08-04','2009-05-21'),(4,'Марчевская','ул. Строителей','2003-10-03','2010-02-19'),(5,'Алексеев','1-я Парковая ул.','2000-06-13','2008-01-01'),(6,'Серебряный','2-я Парковая ул.','2001-04-19','2007-09-12'),(7,'Михайлов','Москва, Ленинская 3','1935-07-07','2023-01-01'),(8,'Новиков','Москва, Ленинский проспект 4','1925-08-08','2023-01-01'),(9,'Фёдоров','Москва, Ленинская 4','1915-09-09','2023-01-01'),(10,'Морозов','Москва, Ленинский проспект 5','1905-10-10','2023-01-01'),(11,'Волков','Москва, Ленинская 5','1895-11-11','2023-01-01'),(12,'Алексеева','Москва, Ленинский проспект 6','1885-12-12','2023-01-01'),(13,'Лебедев','Москва, Ленинская 6','1875-01-13','2023-01-01'),(14,'Семёнов','Москва, Ленинский проспект 7','1865-02-14','2023-01-01'),(15,'Егоров','Москва, Ленинская 7','1855-03-15','2023-01-01'),(16,'Павлов','Москва, Ленинский проспект 8','1845-04-16','2023-01-01'),(17,'Козлов','Москва, Ленинская 8','1835-05-17','2023-01-01'),(18,'Степанов','Москва, Ленинский проспект 9','1825-06-18','2023-01-01'),(19,'Николаев','Москва, Ленинская 9','1815-07-19','2023-01-01'),(20,'Орлов','Москва, Ленинский проспект 10','1805-08-20','2023-01-01'),(21,'Соколов','Москва, Ленинский проспект 3','1945-06-06','2023-01-01'),(22,'Попов','Москва, Ленинская 2','1955-05-05','2023-01-01'),(23,'Кузнецов','Москва, Ленинский проспект 2','1965-04-04','2023-01-01'),(24,'Смирнов','Москва, Ленинская 1','1975-03-03','2023-01-01'),(25,'Петров','Москва, Ленинградская 1','1985-02-02','2023-01-01'),(26,'Иванов','Москва, Ленинский проспект 1','1990-01-01','2023-01-01');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
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
