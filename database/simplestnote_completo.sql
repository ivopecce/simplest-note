CREATE DATABASE  IF NOT EXISTS `simplestnote` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `simplestnote`;
-- MySQL dump 10.13  Distrib 8.0.20, for Linux (x86_64)
--
-- Host: localhost    Database: simplestnote
-- ------------------------------------------------------
-- Server version	8.0.20-0ubuntu0.20.04.1

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
-- Table structure for table `Allegato`
--

DROP TABLE IF EXISTS `Allegato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Allegato` (
  `ID_allegato` int unsigned NOT NULL AUTO_INCREMENT,
  `descrizione` varchar(100) DEFAULT NULL,
  `allegato` blob NOT NULL,
  `ID_descrizione` int NOT NULL,
  PRIMARY KEY (`ID_allegato`),
  KEY `ID_descr_idx` (`ID_descrizione`),
  CONSTRAINT `ID_descri` FOREIGN KEY (`ID_descrizione`) REFERENCES `Descrizione` (`ID_descrizione`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Allegato`
--

LOCK TABLES `Allegato` WRITE;
/*!40000 ALTER TABLE `Allegato` DISABLE KEYS */;
/*!40000 ALTER TABLE `Allegato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cataloga`
--

DROP TABLE IF EXISTS `Cataloga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cataloga` (
  `ID_cataloga` int NOT NULL AUTO_INCREMENT,
  `ID_nota` int NOT NULL,
  `ID_tag` int NOT NULL,
  PRIMARY KEY (`ID_cataloga`),
  KEY `ID_nota_idx` (`ID_nota`),
  KEY `ID_tag_idx` (`ID_tag`),
  CONSTRAINT `ID_not` FOREIGN KEY (`ID_nota`) REFERENCES `Nota` (`ID_nota`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ID_tag` FOREIGN KEY (`ID_tag`) REFERENCES `Tag` (`ID_tag`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cataloga`
--

LOCK TABLES `Cataloga` WRITE;
/*!40000 ALTER TABLE `Cataloga` DISABLE KEYS */;
INSERT INTO `Cataloga` VALUES (1,1,1);
/*!40000 ALTER TABLE `Cataloga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Descrizione`
--

DROP TABLE IF EXISTS `Descrizione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Descrizione` (
  `ID_descrizione` int NOT NULL AUTO_INCREMENT,
  `data` datetime NOT NULL,
  `titolo` varchar(100) NOT NULL DEFAULT '[Inserisci un titolo]',
  PRIMARY KEY (`ID_descrizione`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Descrizione`
--

LOCK TABLES `Descrizione` WRITE;
/*!40000 ALTER TABLE `Descrizione` DISABLE KEYS */;
INSERT INTO `Descrizione` VALUES (1,'2020-06-06 12:10:30','Test di prova'),(84,'2020-06-08 12:34:18','aaaa'),(85,'2020-06-08 15:58:28','Test'),(86,'2020-06-08 20:56:38','aldo'),(89,'2020-06-08 22:27:54','Test'),(95,'2020-06-09 13:36:03','provissima');
/*!40000 ALTER TABLE `Descrizione` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Descrizione_BEFORE_UPDATE` BEFORE UPDATE ON `Descrizione` FOR EACH ROW BEGIN
 INSERT INTO Storico_descrizioni(Storico_descrizioni.ID_descrizione, Storico_descrizioni.data,Storico_descrizioni.titolo)
    VALUES(OLD.ID_descrizione, OLD.data, OLD.titolo);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Gestisce`
--

DROP TABLE IF EXISTS `Gestisce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Gestisce` (
  `ID_gestisce` int NOT NULL AUTO_INCREMENT,
  `ID_utente` int NOT NULL,
  `ID_nota` int NOT NULL,
  `privilegi` varchar(15) NOT NULL,
  PRIMARY KEY (`ID_gestisce`),
  KEY `ID_utente_idx` (`ID_utente`),
  KEY `ID_nota_idx` (`ID_nota`),
  CONSTRAINT `ID_nota` FOREIGN KEY (`ID_nota`) REFERENCES `Nota` (`ID_nota`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ID_utente` FOREIGN KEY (`ID_utente`) REFERENCES `Utente` (`ID_utente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Gestisce`
--

LOCK TABLES `Gestisce` WRITE;
/*!40000 ALTER TABLE `Gestisce` DISABLE KEYS */;
INSERT INTO `Gestisce` VALUES (1,1,1,'proprietario'),(4,3,1,'scrittura'),(79,1,81,'proprietario'),(80,1,82,'proprietario'),(81,1,83,'proprietario'),(84,1,86,'proprietario'),(90,1,92,'proprietario');
/*!40000 ALTER TABLE `Gestisce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Modifica`
--

DROP TABLE IF EXISTS `Modifica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Modifica` (
  `ID_modifica` int NOT NULL AUTO_INCREMENT,
  `ID_utente` int NOT NULL,
  `ID_paragrafo` int NOT NULL,
  `data` datetime NOT NULL,
  PRIMARY KEY (`ID_modifica`),
  KEY `ID_user_idx` (`ID_utente`),
  KEY `ID_par_idx` (`ID_paragrafo`),
  CONSTRAINT `ID_par` FOREIGN KEY (`ID_paragrafo`) REFERENCES `Paragrafo` (`ID_paragrafo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ID_user` FOREIGN KEY (`ID_utente`) REFERENCES `Utente` (`ID_utente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Modifica`
--

LOCK TABLES `Modifica` WRITE;
/*!40000 ALTER TABLE `Modifica` DISABLE KEYS */;
INSERT INTO `Modifica` VALUES (3,1,5,'2020-06-06 13:23:01'),(4,1,5,'2020-06-06 14:52:13'),(20,1,29,'2020-06-08 12:34:18'),(21,1,30,'2020-06-08 12:34:18'),(22,1,31,'2020-06-08 15:58:28'),(23,1,32,'2020-06-08 15:58:28'),(26,1,35,'2020-06-08 22:27:54'),(27,1,36,'2020-06-08 22:27:54'),(28,1,37,'2020-06-08 22:27:54'),(43,1,42,'2020-06-09 14:58:34'),(44,1,42,'2020-06-09 14:58:39'),(46,1,42,'2020-06-09 15:02:12'),(47,1,44,'2020-06-09 17:07:55');
/*!40000 ALTER TABLE `Modifica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Nota`
--

DROP TABLE IF EXISTS `Nota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Nota` (
  `ID_nota` int NOT NULL AUTO_INCREMENT,
  `data_creazione` datetime NOT NULL,
  `ID_descrizione` int NOT NULL,
  `ID_superiore` int DEFAULT NULL,
  `livello` int NOT NULL DEFAULT '0',
  `archivio` tinyint NOT NULL DEFAULT '0',
  `cestino` tinyint NOT NULL DEFAULT '0',
  `data_cestino` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_nota`),
  UNIQUE KEY `ID_descrizione_UNIQUE` (`ID_descrizione`),
  KEY `ID_descrizione_idx` (`ID_descrizione`),
  KEY `ID_superiore_idx` (`ID_superiore`),
  CONSTRAINT `ID_descrizione` FOREIGN KEY (`ID_descrizione`) REFERENCES `Descrizione` (`ID_descrizione`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ID_superiore` FOREIGN KEY (`ID_superiore`) REFERENCES `Nota` (`ID_nota`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Nota`
--

LOCK TABLES `Nota` WRITE;
/*!40000 ALTER TABLE `Nota` DISABLE KEYS */;
INSERT INTO `Nota` VALUES (1,'2020-06-06 12:10:30',1,NULL,0,0,0,NULL),(81,'2020-06-08 12:34:18',84,1,1,0,0,NULL),(82,'2020-06-08 15:58:28',85,1,1,0,0,NULL),(83,'2020-06-08 20:56:38',86,81,2,0,0,NULL),(86,'2020-06-08 22:27:54',89,NULL,0,0,0,NULL),(92,'2020-06-09 13:36:03',95,NULL,0,0,0,NULL);
/*!40000 ALTER TABLE `Nota` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Nota_BEFORE_UPDATE` BEFORE UPDATE ON `Nota` FOR EACH ROW BEGIN
	DECLARE _data_cestino timestamp;
	IF NEW.cestino=1 THEN
    BEGIN
		SET _data_cestino=current_timestamp();
        SET NEW.data_cestino=_data_cestino;
    END;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Paragrafo`
--

DROP TABLE IF EXISTS `Paragrafo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Paragrafo` (
  `ID_paragrafo` int NOT NULL AUTO_INCREMENT,
  `contenuto` text NOT NULL,
  `ID_descrizione` int NOT NULL,
  `posizione` int NOT NULL,
  PRIMARY KEY (`ID_paragrafo`),
  KEY `ID_descriz_idx` (`ID_descrizione`),
  CONSTRAINT `ID_descriz` FOREIGN KEY (`ID_descrizione`) REFERENCES `Descrizione` (`ID_descrizione`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Paragrafo`
--

LOCK TABLES `Paragrafo` WRITE;
/*!40000 ALTER TABLE `Paragrafo` DISABLE KEYS */;
INSERT INTO `Paragrafo` VALUES (1,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',1,1),(2,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',1,2),(3,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',1,3),(4,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',1,4),(5,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.',1,5),(29,'abc',84,1),(30,'def',84,2),(31,'prova',85,1),(32,'aaaaaa',85,2),(35,'dddd',89,1),(36,'gggg',89,2),(37,'aaaa',89,3),(42,'provaprivissma',95,1),(44,'prova aggiunta',86,1);
/*!40000 ALTER TABLE `Paragrafo` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Paragrafo_BEFORE_UPDATE` BEFORE UPDATE ON `Paragrafo` FOR EACH ROW BEGIN
 INSERT INTO Storico_paragrafi(Storico_paragrafi.ID_paragrafo, Storico_paragrafi.data, Storico_paragrafi.contenuto, Storico_paragrafi.ID_descrizione, Storico_paragrafi.posizione, Storico_paragrafi.user)
 VALUES(OLD.ID_paragrafo, (SELECT data from Modifica WHERE Modifica.ID_paragrafo=OLD.ID_paragrafo ORDER BY data DESC LIMIT 1), OLD.contenuto, OLD.ID_descrizione, OLD.posizione, (SELECT user from (Utente INNER JOIN Modifica on Utente.ID_utente=Modifica.ID_utente) INNER JOIN Paragrafo on OLD.ID_paragrafo=Modifica.ID_paragrafo WHERE data=Modifica.data ORDER BY data DESC LIMIT 1));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Storico_descrizioni`
--

DROP TABLE IF EXISTS `Storico_descrizioni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Storico_descrizioni` (
  `ID_s_descrizione` int NOT NULL AUTO_INCREMENT,
  `ID_descrizione` int DEFAULT NULL,
  `data` datetime NOT NULL,
  `titolo` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_s_descrizione`),
  KEY `ID_descrizione_idx` (`ID_descrizione`),
  CONSTRAINT `ID_descr` FOREIGN KEY (`ID_descrizione`) REFERENCES `Descrizione` (`ID_descrizione`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Storico_descrizioni`
--

LOCK TABLES `Storico_descrizioni` WRITE;
/*!40000 ALTER TABLE `Storico_descrizioni` DISABLE KEYS */;
INSERT INTO `Storico_descrizioni` VALUES (1,1,'2020-06-06 12:10:30','Test di prova');
/*!40000 ALTER TABLE `Storico_descrizioni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Storico_paragrafi`
--

DROP TABLE IF EXISTS `Storico_paragrafi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Storico_paragrafi` (
  `ID_s_paragrafo` int NOT NULL AUTO_INCREMENT,
  `ID_paragrafo` int NOT NULL,
  `data` datetime NOT NULL,
  `contenuto` text NOT NULL,
  `ID_descrizione` int NOT NULL,
  `posizione` int NOT NULL,
  `user` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_s_paragrafo`),
  KEY `ID_paragrafo_idx` (`ID_paragrafo`),
  KEY `ID_desc_idx` (`ID_descrizione`),
  CONSTRAINT `ID_desc` FOREIGN KEY (`ID_descrizione`) REFERENCES `Paragrafo` (`ID_descrizione`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ID_paragrafo` FOREIGN KEY (`ID_paragrafo`) REFERENCES `Paragrafo` (`ID_paragrafo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Storico_paragrafi`
--

LOCK TABLES `Storico_paragrafi` WRITE;
/*!40000 ALTER TABLE `Storico_paragrafi` DISABLE KEYS */;
INSERT INTO `Storico_paragrafi` VALUES (5,5,'2020-06-06 13:23:01','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',1,5,'ivopecce');
/*!40000 ALTER TABLE `Storico_paragrafi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tag`
--

DROP TABLE IF EXISTS `Tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tag` (
  `ID_tag` int NOT NULL AUTO_INCREMENT,
  `tag` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_tag`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tag`
--

LOCK TABLES `Tag` WRITE;
/*!40000 ALTER TABLE `Tag` DISABLE KEYS */;
INSERT INTO `Tag` VALUES (1,'test');
/*!40000 ALTER TABLE `Tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Utente`
--

DROP TABLE IF EXISTS `Utente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Utente` (
  `ID_utente` int NOT NULL AUTO_INCREMENT,
  `cognome` varchar(30) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `user` varchar(45) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_utente`),
  UNIQUE KEY `user_UNIQUE` (`user`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Utente`
--

LOCK TABLES `Utente` WRITE;
/*!40000 ALTER TABLE `Utente` DISABLE KEYS */;
INSERT INTO `Utente` VALUES (1,'pecce','ivo','ivopecce','5f4dcc3b5aa765d61d8327deb882cf99'),(3,'pecce','giuseppe','gpecce','5f4dcc3b5aa765d61d8327deb882cf99');
/*!40000 ALTER TABLE `Utente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'simplestnote'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `simplest_pulisci_cestino` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `simplest_pulisci_cestino` ON SCHEDULE EVERY 1 DAY STARTS '2020-06-10 19:22:20' ON COMPLETION NOT PRESERVE ENABLE DO CALL pulisci_cestino() */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'simplestnote'
--
/*!50003 DROP FUNCTION IF EXISTS `nota_ultima_modifica` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `nota_ultima_modifica`(_ID_nota integer) RETURNS datetime
    DETERMINISTIC
BEGIN
	DECLARE _data datetime;
    SET _data = (SELECT Modifica.data FROM ((Nota INNER JOIN Descrizione on Nota.ID_descrizione=Descrizione.ID_descrizione) INNER JOIN Paragrafo on Paragrafo.ID_descrizione=Descrizione.ID_descrizione) INNER JOIN Modifica on Paragrafo.ID_paragrafo=Modifica.ID_paragrafo WHERE ID_nota=_ID_nota ORDER BY Modifica.data DESC LIMIT 1);
    IF _data IS NULL THEN
    BEGIN
		RETURN (SELECT Descrizione.data FROM (Nota INNER JOIN Descrizione on Nota.ID_descrizione=Descrizione.ID_descrizione) WHERE Nota.ID_nota=_ID_nota);
	END;
	ELSE
    BEGIN
		RETURN _data;
	END;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `vedi_paragrafo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `vedi_paragrafo`(_ID_paragrafo integer) RETURNS text CHARSET utf8
    DETERMINISTIC
BEGIN
	RETURN (SELECT DISTINCT contenuto FROM Paragrafo WHERE ID_paragrafo=_ID_paragrafo);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `visualizza_testo_nota` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `visualizza_testo_nota`(_ID_nota integer) RETURNS text CHARSET utf8
    DETERMINISTIC
BEGIN
    DECLARE _out text;
    SET group_concat_max_len = CAST((SELECT SUM(LENGTH(contenuto)) +lENGTH("\n-----\n-----\n\n")*COUNT(*) + COUNT(*) * LENGTH(', ') FROM ((Nota INNER JOIN Descrizione ON Nota.ID_descrizione=Descrizione.ID_descrizione)INNER JOIN Paragrafo ON Paragrafo.ID_descrizione=Descrizione.ID_descrizione) WHERE ID_nota=_ID_nota ORDER BY ID_paragrafo) AS UNSIGNED);
	SET _out = (SELECT group_concat(contenuto SEPARATOR "\n-----\n-----\n\n") FROM ((Nota INNER JOIN Descrizione ON Nota.ID_descrizione=Descrizione.ID_descrizione)INNER JOIN Paragrafo ON Paragrafo.ID_descrizione=Descrizione.ID_descrizione) WHERE ID_nota=_ID_nota ORDER BY ID_paragrafo);
	IF _out IS NULL THEN BEGIN RETURN ""; END; 
    ELSE
    BEGIN
		RETURN _out;
    END;
    END IF;
    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `aggiungi_tag` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `aggiungi_tag`(_tag varchar(45), _ID_nota int)
BEGIN
	DECLARE _tag_ID integer;
    IF _tag NOT IN (SELECT tag FROM Tag WHERE tag=_tag) THEN
    BEGIN
        INSERT INTO Tag(tag) VALUES (_tag);
        SET _tag_ID = last_insert_id();
        INSERT INTO Cataloga(ID_nota, ID_tag) VALUES (_ID_nota, _tag_ID);
    END;
	ELSE
    BEGIN
		SET _tag_ID = (SELECT ID_tag FROM Tag WHERE tag=_tag);
        INSERT INTO Cataloga(ID_nota, ID_tag) VALUES (_ID_nota, _tag_ID);
    END;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `aggiungi_utente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `aggiungi_utente`(_cognome char(30), _nome char(30), _user char(45), _password char(50))
BEGIN
	DECLARE user_presente char(45);
	SET user_presente=(select user from Utente where user=_user);
	IF(user_presente) THEN
	BEGIN
		SIGNAL SQLSTATE '45000' SET message_text = "Username gia' presente";
	END;
    ELSE
    BEGIN
		INSERT INTO Utente(cognome, nome, user, password) VALUES (_cognome, _nome, _user, _password);
	END;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `archivia_nota` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `archivia_nota`(_ID_nota integer)
BEGIN
	UPDATE Nota SET archivio=1 WHERE ID_nota=_ID_nota;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cancella_nota` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cancella_nota`(_ID_nota integer)
BEGIN
	DECLARE id integer;
	SET id = (SELECT ID_descrizione FROM Nota WHERE Nota.ID_nota=_ID_nota);
    DELETE FROM Nota WHERE Nota.ID_nota=_ID_nota;
    DELETE FROM Descrizione WHERE ID_descrizione=id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cancella_utente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cancella_utente`(_ID_utente integer)
BEGIN
	DECLARE fine INT DEFAULT 0;
	DECLARE ID_nota INT;
	DECLARE cursore1 CURSOR FOR SELECT Nota.ID_nota FROM Nota INNER JOIN Gestisce ON Gestisce.ID_nota=Nota.ID_nota WHERE Gestisce.ID_utente=_ID_utente and Gestisce.privilegi='proprietario';
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET fine = 1;

	OPEN cursore1;
	REPEAT
		FETCH cursore1 INTO ID_nota;
		IF NOT fine THEN
			CALL cancella_nota(ID_nota);
		END IF;
	UNTIL fine END REPEAT;
	CLOSE cursore1;
    
DELETE FROM Utente WHERE ID_utente=_ID_utente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `elimina_allegato` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `elimina_allegato`(_ID_allegato integer)
BEGIN
	DELETE FROM Allegato WHERE ID_allegato = _ID_allegato;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `inserisci_allegato` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `inserisci_allegato`(_desc varchar(100), _ID_nota integer, p_allegato varchar(45))
BEGIN
	DECLARE _ID_desc integer;
	SET _ID_desc = (SELECT ID_descrizione FROM Nota WHERE ID_nota=_ID_nota);
    INSERT INTO Allegato(descrizione, allegato, ID_descrizione) VALUES (_desc, LOAD_FILE(p_allegato), _ID_desc);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `lista_note` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `lista_note`(_ID_utente integer)
BEGIN
	SELECT Nota.ID_nota, titolo, visualizza_testo_nota(Nota.ID_nota) AS testo, nota_ultima_modifica(Nota.ID_nota) as data_ultima_modifica, (SELECT user FROM Utente INNER JOIN Gestisce ON Utente.ID_utente=Gestisce.ID_Utente WHERE Gestisce.ID_nota=ID_nota and privilegi='proprietario' LIMIT 1) AS proprietario, privilegi
    FROM Gestisce INNER JOIN ((Nota INNER JOIN Descrizione ON Nota.ID_descrizione=Descrizione.ID_descrizione)) ON Gestisce.ID_nota=Nota.ID_nota
	WHERE Gestisce.ID_utente=_ID_utente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `lista_paragrafi` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `lista_paragrafi`(_ID_Nota integer)
BEGIN
	SELECT ID_nota as id, Descrizione.titolo as titolo, ID_paragrafo as idparagrafo, Paragrafo.contenuto as testo, Paragrafo.posizione as posizione, Paragrafo.ID_descrizione as iddescrizione
    FROM (Nota INNER JOIN Descrizione ON Nota.ID_descrizione = Descrizione.ID_descrizione) INNER JOIN Paragrafo ON Paragrafo.ID_descrizione=Descrizione.ID_descrizione
    WHERE Nota.ID_nota = _ID_nota;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modifica_paragrafo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `modifica_paragrafo`(_ID_paragrafo integer, _contenuto text, _ID_utente integer)
BEGIN
	UPDATE Paragrafo SET contenuto=_contenuto where ID_paragrafo=_ID_paragrafo;
    INSERT INTO Modifica(ID_utente, ID_paragrafo, data) VALUES(_ID_utente, _ID_paragrafo, current_timestamp());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modifica_permessi` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `modifica_permessi`(_ID_utente integer, _ID_nota integer, _permessi char(15))
BEGIN
	DECLARE _privilegi char(15);
    SET _privilegi = (SELECT privilegi FROM Gestisce WHERE ID_utente=_ID_utente);
	IF _privilegi = 'proprietario' THEN SIGNAL SQLSTATE '45000' SET message_text = "Utente proprietario, impossibile modificare i permessi sulla nota"; END IF;
	IF (_permessi = 'nessuno') THEN 
    BEGIN
		DELETE FROM Gestisce WHERE ID_utente=_ID_utente and ID_nota=_ID_nota; 
	END;
    ELSE
    BEGIN
		IF _privilegi IS NULL THEN
        BEGIN
			INSERT INTO Gestisce(ID_utente, ID_nota, privilegi) VALUES (_ID_utente, _ID_nota, _permessi);
		END;
        ELSE
        BEGIN
			UPDATE Gestisce SET privilegi=_permessi WHERE ID_utente=_ID_utente and ID_nota=_ID_nota;
		END;
        END IF;
    END;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modifica_titolo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `modifica_titolo`(_ID_descrizione integer, _titolo char(100))
BEGIN
	UPDATE Descrizione SET titolo=_titolo WHERE ID_descrizione=_ID_descrizione;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `nota_ultima_modifica` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `nota_ultima_modifica`(_ID_nota integer)
BEGIN
	SELECT Modifica.data FROM ((Nota INNER JOIN Descrizione on Nota.ID_descrizione=Descrizione.ID_descrizione) INNER JOIN Paragrafo on Paragrafo.ID_descrizione=Descrizione.ID_descrizione) INNER JOIN Modifica on Paragrafo.ID_paragrafo=Modifica.ID_paragrafo WHERE ID_nota=_ID_nota ORDER BY Modifica.data DESC LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `nuova_nota` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `nuova_nota`(IN _titolo char(100), IN _user char(45), OUT _id1 integer)
BEGIN
	DECLARE _data timestamp;
	DECLARE _id2 integer;
    DECLARE IDutente integer;
	SET _data = current_timestamp();
	INSERT INTO Descrizione(data, titolo) VALUES(_data, _titolo);
    SET _id1 = last_insert_id();
    INSERT INTO Nota(data_creazione, ID_descrizione) VALUES(_data, _id1);
    SET _id2 = last_insert_id();
    SET IDutente = (SELECT ID_utente FROM Utente WHERE user = _user);
    INSERT INTO Gestisce(ID_utente, ID_nota, privilegi) VALUES(IDutente, _id2, "proprietario");
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `nuovo_paragrafo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `nuovo_paragrafo`(_contenuto text, _ID_descrizione integer, _ID_utente integer)
BEGIN
	Declare _data datetime;
    Declare _id_paragrafo integer;
    DECLARE _posizione integer;
    SET _data = current_timestamp();
    SET _posizione = (SELECT MAX(posizione) FROM Paragrafo WHERE Paragrafo.ID_descrizione=_ID_descrizione);
    IF _posizione IS NULL THEN 
    BEGIN
		SET _posizione = 1;
	END;
    ELSE
    BEGIN
		SET _posizione = _posizione+1;
	END;
    END IF;
	INSERT INTO Paragrafo(contenuto, ID_descrizione, posizione)
    VALUES(_contenuto, _ID_descrizione, _posizione);
    SET _id_paragrafo = last_insert_id();
    INSERT INTO Modifica(ID_utente, ID_paragrafo, data) VALUES(_ID_utente, _id_paragrafo, _data);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pulisci_cestino` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pulisci_cestino`()
BEGIN
	DECLARE fine INT DEFAULT 0;
	DECLARE ID_nota INT;
	DECLARE cursore1 CURSOR FOR (SELECT Nota.ID_nota FROM Nota WHERE cestino=1 and (SELECT timestampadd(day, 7, Nota.data_cestino))> current_timestamp);
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET fine = 1;

	OPEN cursore1;
	REPEAT
		FETCH cursore1 INTO ID_nota;
		IF NOT fine THEN
			CALL cancella_nota(ID_nota);
		END IF;
	UNTIL fine END REPEAT;
	CLOSE cursore1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ricerca_contenuto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ricerca_contenuto`(_contenuto text, _ID_utente integer)
BEGIN
	DROP TEMPORARY TABLE IF EXISTS tmp;
    CREATE TEMPORARY TABLE tmp SELECT titolo, visualizza_testo_nota(Nota.ID_nota) AS testo
    FROM ((Nota INNER JOIN Descrizione ON Nota.ID_descrizione=Descrizione.ID_descrizione) INNER JOIN Paragrafo ON Paragrafo.ID_descrizione=Descrizione.ID_descrizione) Inner JOIN Gestisce ON Nota.ID_nota=Gestisce.ID_nota
    WHERE Gestisce.ID_utente=_ID_utente and privilegi IN ('proprietario', 'lettura', 'scrittura');
    
    SELECT DISTINCT titolo
    FROM tmp   
    WHERE testo = '%'+_contenuto+'%';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ricerca_tag` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ricerca_tag`(_tag char(45), _ID_utente integer)
BEGIN
	SELECT titolo 
    FROM (((Nota INNER JOIN Descrizione on Nota.ID_descrizione=Descrizione.ID_descrizione) INNER JOIN Cataloga on Cataloga.ID_nota=Nota.ID_nota) INNER JOIN Tag on Cataloga.ID_tag=Tag.ID_tag) Inner JOIN Gestisce ON Nota.ID_nota=Gestisce.ID_nota
    WHERE Tag.tag = '%'+_tag+'%' and Gestisce.ID_utente=_ID_utente and privilegi IN ('proprietario', 'lettura', 'scrittura');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ricerca_titolo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ricerca_titolo`(_titolo char(100), _ID_utente integer)
BEGIN
	SELECT titolo
    FROM (Nota INNER JOIN Descrizione on Nota.ID_descrizione=Descrizione.ID_descrizione) Inner JOIN Gestisce ON Nota.ID_nota=Gestisce.ID_nota
    WHERE titolo='%'+_titolo+'%' and Gestisce.ID_utente=_ID_utente and privilegi IN ('proprietario', 'lettura', 'scrittura');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rimuovi_tag` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `rimuovi_tag`(_tag varchar(45), _ID_nota integer)
BEGIN
	DECLARE _tag_ID integer;
    SET _tag_ID = (SELECT ID_tag FROM Tag WHERE tag=_tag);
    DELETE FROM Cataloga WHERE ID_tag=_tag_ID and ID_nota=_ID_nota;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sottonota` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sottonota`(_ID_nota INT, _ID_superiore INT )
BEGIN
	DECLARE _livello integer;
    SET _livello = (SELECT livello FROM Nota WHERE Nota.ID_nota=_ID_nota);
    IF _livello<2 THEN 
    BEGIN
		IF (SELECT * FROM Nota WHERE ID_nota=_ID_nota) and (SELECT * FROM Nota WHERE ID_nota=_ID_superiore) THEN
		BEGIN
			UPDATE Nota SET ID_superiore=_ID_superiore, livello=livello+1 WHERE Nota.ID_nota=_ID_nota;
		END;
		END IF;
	END;
    ELSE
    BEGIN
		SIGNAL SQLSTATE '45000' SET message_text = "La nota non puo' essere impostata come sottonota";
    END;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `storico_paragrafo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `storico_paragrafo`(_ID_paragrafo integer)
BEGIN
	SELECT contenuto, posizione, data, user
    FROM Storico_paragrafi
    WHERE ID_paragrafo = _ID_paragrafo
    ORDER BY data ASC;
    
    SELECT contenuto, posizione, data, user
    FROM (Paragrafo INNER JOIN Modifica ON Paragrafo.ID_paragrafo=Modifica.ID_paragrafo) INNER JOIN Utente ON Modifica.ID_utente=Utente.ID_utente
    WHERE Paragrafo.ID_paragrafo=_ID_paragrafo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `visualizza_nota` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `visualizza_nota`(_ID_nota integer)
BEGIN
	SELECT Nota.ID_nota, titolo, visualizza_testo_nota(Nota.ID_nota) AS testo, nota_ultima_modifica(Nota.ID_nota) as data_ultima_modifica
    FROM Nota INNER JOIN Descrizione ON Nota.ID_descrizione=Descrizione.ID_descrizione
    WHERE Nota.ID_nota=_ID_nota;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `visualizza_sottonote` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `visualizza_sottonote`(_ID_nota integer)
BEGIN
	DECLARE _livello integer;
    SET _livello = (SELECT livello FROM Nota WHERE Nota.ID_nota=_ID_nota);
    IF _livello<2 THEN
    BEGIN
		
        /*SELECT titolo, livello AS sottolivello FROM (Nota INNER JOIN Descrizione ON Nota.ID_descrizione=Descrizione.ID_descrizione) WHERE ID_superiore=ID_Nota;*/
        
        select ID_nota, titolo, livello, ID_superiore
        from (select ID_nota, titolo, livello, ID_superiore from (Nota INNER JOIN Descrizione ON Nota.ID_descrizione=Descrizione.ID_descrizione) ORDER BY ID_nota) ordinati, (select @pv := _ID_nota) init 
        where find_in_set(ID_superiore, @pv)
        and length(@pv := concat(@pv, ',', ID_nota));
	END;
    ELSE
    BEGIN
    
    END;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-10 19:30:49
