-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: locadora
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `filme`
--

DROP TABLE IF EXISTS `filme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filme` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NOME` varchar(255) NOT NULL,
  `ANO` int NOT NULL,
  `VALOR` double NOT NULL,
  `DESCRICAO` mediumtext,
  `ESTUDIO_ID` int NOT NULL,
  `GENERO_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_FILME_ESTUDIO_idx` (`ESTUDIO_ID`),
  KEY `fk_FILME_GENERO_idx` (`GENERO_ID`),
  CONSTRAINT `fk_FILME_ESTUDIO_ID` FOREIGN KEY (`ESTUDIO_ID`) REFERENCES `estudio` (`ID`),
  CONSTRAINT `fk_FILME_GENERO_ID` FOREIGN KEY (`GENERO_ID`) REFERENCES `genero` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filme`
--

LOCK TABLES `filme` WRITE;
/*!40000 ALTER TABLE `filme` DISABLE KEYS */;
INSERT INTO `filme` VALUES (1,'Carros',2006,15.5,'Carros (no original em inglês Cars) é um filme de animação digital estadunidense de 2006 dos gêneros comédia e road movie produzido pela Pixar Animation Studios e lançado pela Walt Disney Pictures.',1,4),(2,'The House',2022,12,'The House é um longa-metragem britânico de stop-motion antológico escrito por Enda Walsh e contando histórias diferentes formando uma trilogia abrangendo diferentes mundos e personagens, mas dentro da mesma casa. Cada história lida com temas de loucura, riqueza e a busca da verdadeira felicidade.',2,1);
/*!40000 ALTER TABLE `filme` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-14 21:44:28
