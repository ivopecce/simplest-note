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
  `allegato` mediumblob NOT NULL,
  `ID_descrizione` int NOT NULL,
  PRIMARY KEY (`ID_allegato`),
  KEY `ID_descr_idx` (`ID_descrizione`),
  CONSTRAINT `ID_descri` FOREIGN KEY (`ID_descrizione`) REFERENCES `Descrizione` (`ID_descrizione`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
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
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
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
    ELSE
    SET NEW.data_cestino=null;
    BEGIN
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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-11 20:03:04
