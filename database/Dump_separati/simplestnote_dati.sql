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
-- Dumping data for table `Allegato`
--

LOCK TABLES `Allegato` WRITE;
/*!40000 ALTER TABLE `Allegato` DISABLE KEYS */;
/*!40000 ALTER TABLE `Allegato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Cataloga`
--

LOCK TABLES `Cataloga` WRITE;
/*!40000 ALTER TABLE `Cataloga` DISABLE KEYS */;
INSERT INTO `Cataloga` VALUES (1,1,1);
/*!40000 ALTER TABLE `Cataloga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Descrizione`
--

LOCK TABLES `Descrizione` WRITE;
/*!40000 ALTER TABLE `Descrizione` DISABLE KEYS */;
INSERT INTO `Descrizione` VALUES (1,'2020-06-06 12:10:30','Test di prova'),(84,'2020-06-08 12:34:18','aaaa'),(85,'2020-06-08 15:58:28','Test'),(86,'2020-06-08 20:56:38','aldo'),(89,'2020-06-08 22:27:54','Test'),(95,'2020-06-09 13:36:03','provissima');
/*!40000 ALTER TABLE `Descrizione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Gestisce`
--

LOCK TABLES `Gestisce` WRITE;
/*!40000 ALTER TABLE `Gestisce` DISABLE KEYS */;
INSERT INTO `Gestisce` VALUES (1,1,1,'proprietario'),(4,3,1,'scrittura'),(79,1,81,'proprietario'),(80,1,82,'proprietario'),(81,1,83,'proprietario'),(84,1,86,'proprietario'),(90,1,92,'proprietario');
/*!40000 ALTER TABLE `Gestisce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Modifica`
--

LOCK TABLES `Modifica` WRITE;
/*!40000 ALTER TABLE `Modifica` DISABLE KEYS */;
INSERT INTO `Modifica` VALUES (3,1,5,'2020-06-06 13:23:01'),(4,1,5,'2020-06-06 14:52:13'),(20,1,29,'2020-06-08 12:34:18'),(21,1,30,'2020-06-08 12:34:18'),(22,1,31,'2020-06-08 15:58:28'),(23,1,32,'2020-06-08 15:58:28'),(26,1,35,'2020-06-08 22:27:54'),(27,1,36,'2020-06-08 22:27:54'),(28,1,37,'2020-06-08 22:27:54'),(43,1,42,'2020-06-09 14:58:34'),(44,1,42,'2020-06-09 14:58:39'),(46,1,42,'2020-06-09 15:02:12'),(47,1,44,'2020-06-09 17:07:55');
/*!40000 ALTER TABLE `Modifica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Nota`
--

LOCK TABLES `Nota` WRITE;
/*!40000 ALTER TABLE `Nota` DISABLE KEYS */;
INSERT INTO `Nota` VALUES (1,'2020-06-06 12:10:30',1,NULL,0,0,0,NULL),(81,'2020-06-08 12:34:18',84,1,1,0,0,NULL),(82,'2020-06-08 15:58:28',85,1,1,0,0,NULL),(83,'2020-06-08 20:56:38',86,81,2,0,0,NULL),(86,'2020-06-08 22:27:54',89,NULL,0,0,0,NULL),(92,'2020-06-09 13:36:03',95,NULL,0,0,0,NULL);
/*!40000 ALTER TABLE `Nota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Paragrafo`
--

LOCK TABLES `Paragrafo` WRITE;
/*!40000 ALTER TABLE `Paragrafo` DISABLE KEYS */;
INSERT INTO `Paragrafo` VALUES (1,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',1,1),(2,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',1,2),(3,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',1,3),(4,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',1,4),(5,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.',1,5),(29,'abc',84,1),(30,'def',84,2),(31,'prova',85,1),(32,'aaaaaa',85,2),(35,'dddd',89,1),(36,'gggg',89,2),(37,'aaaa',89,3),(42,'provaprivissma',95,1),(44,'prova aggiunta',86,1);
/*!40000 ALTER TABLE `Paragrafo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Storico_descrizioni`
--

LOCK TABLES `Storico_descrizioni` WRITE;
/*!40000 ALTER TABLE `Storico_descrizioni` DISABLE KEYS */;
INSERT INTO `Storico_descrizioni` VALUES (1,1,'2020-06-06 12:10:30','Test di prova');
/*!40000 ALTER TABLE `Storico_descrizioni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Storico_paragrafi`
--

LOCK TABLES `Storico_paragrafi` WRITE;
/*!40000 ALTER TABLE `Storico_paragrafi` DISABLE KEYS */;
INSERT INTO `Storico_paragrafi` VALUES (5,5,'2020-06-06 13:23:01','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',1,5,'ivopecce');
/*!40000 ALTER TABLE `Storico_paragrafi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Tag`
--

LOCK TABLES `Tag` WRITE;
/*!40000 ALTER TABLE `Tag` DISABLE KEYS */;
INSERT INTO `Tag` VALUES (1,'test');
/*!40000 ALTER TABLE `Tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Utente`
--

LOCK TABLES `Utente` WRITE;
/*!40000 ALTER TABLE `Utente` DISABLE KEYS */;
INSERT INTO `Utente` VALUES (1,'pecce','ivo','ivopecce','5f4dcc3b5aa765d61d8327deb882cf99'),(3,'pecce','giuseppe','gpecce','5f4dcc3b5aa765d61d8327deb882cf99');
/*!40000 ALTER TABLE `Utente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-10 19:30:15
