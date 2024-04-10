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
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `doc_id` int NOT NULL AUTO_INCREMENT,
  `passport` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `birth_year` year NOT NULL,
  `specialization` varchar(45) NOT NULL,
  `hire_date` date NOT NULL,
  `fire_date` date DEFAULT NULL,
  `docs_department` int NOT NULL,
  PRIMARY KEY (`doc_id`),
  KEY `docs_department_idx` (`docs_department`),
  CONSTRAINT `docs_department` FOREIGN KEY (`docs_department`) REFERENCES `department` (`department_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,'Эргюн','ул. Кирова',1992,'стоматолог','2021-03-14',NULL,1),(2,'Калиниченко','ул. Победы',1991,'невролог','2023-04-18',NULL,2),(3,'Колосова','ул. Ленина',1988,'гинеколог','2020-01-25',NULL,3),(4,'Попов','ул. Красноармейская',1967,'нарколог','2020-02-12',NULL,2),(8,'Москвичева','ул. Кирова',1967,'педиатр','2021-04-09',NULL,4),(9,'Рентген','ул. Комсомольская',1984,'рентгенолог','2021-10-25',NULL,5),(10,'Самойлова','пр-т Буденного',1973,'терапевт стационара','2022-11-17',NULL,6),(11,'Пушкин','ул. Замоскворецкая',1989,'педиатр','2022-08-30',NULL,4),(12,'Ахматова','ул. Строителей',1991,'гинеколог','2022-12-01',NULL,3),(13,'Петров','Москва, Ленинский проспект 1',1970,'Кардиолог','2000-01-01',NULL,1),(14,'Смирнов','Москва, Ленинский проспект 2',1975,'Невролог','2005-01-01',NULL,2),(15,'Кузнецов','Москва, Ленинский проспект 3',1980,'Офтальмолог','2010-01-01',NULL,3),(16,'Попов','Москва, Ленинский проспект 4',1985,'Ортопед','2015-01-01',NULL,4),(17,'Соколов','Москва, Ленинский проспект 5',1990,'Хирург','2020-01-01',NULL,5),(18,'Михайлов','Москва, Ленинский проспект 6',1995,'Гинеколог','2025-01-01',NULL,6),(19,'Новиков','Москва, Ленинский проспект 7',2000,'Педиатр','2030-01-01',NULL,7),(20,'Фёдоров','Москва, Ленинский проспект 8',1999,'Терапевт','2035-01-01',NULL,8),(21,'Морозов','Москва, Ленинский проспект 9',2000,'Дерматовенеролог','2040-01-01',NULL,9),(22,'Волков','Москва, Ленинский проспект 10',1986,'Психиатр','2045-01-01',NULL,10);
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-10 13:45:25
