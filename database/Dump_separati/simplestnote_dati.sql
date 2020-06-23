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
INSERT INTO `Allegato` VALUES (1,'prova',_binary '/home/ivo/test.txt',1);
/*!40000 ALTER TABLE `Allegato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Cataloga`
--

LOCK TABLES `Cataloga` WRITE;
/*!40000 ALTER TABLE `Cataloga` DISABLE KEYS */;
INSERT INTO `Cataloga` VALUES (2,95,1);
/*!40000 ALTER TABLE `Cataloga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Descrizione`
--

LOCK TABLES `Descrizione` WRITE;
/*!40000 ALTER TABLE `Descrizione` DISABLE KEYS */;
INSERT INTO `Descrizione` VALUES (1,'2020-06-06 12:10:30','Test di prova'),(98,'2020-06-11 19:46:25','Titolo di prova 1'),(99,'2020-06-23 17:34:42','Test sottonote');
/*!40000 ALTER TABLE `Descrizione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Gestisce`
--

LOCK TABLES `Gestisce` WRITE;
/*!40000 ALTER TABLE `Gestisce` DISABLE KEYS */;
INSERT INTO `Gestisce` VALUES (1,1,1,'proprietario'),(93,13,95,'proprietario'),(94,1,95,'lettura'),(95,1,96,'proprietario');
/*!40000 ALTER TABLE `Gestisce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Modifica`
--

LOCK TABLES `Modifica` WRITE;
/*!40000 ALTER TABLE `Modifica` DISABLE KEYS */;
INSERT INTO `Modifica` VALUES (3,1,5,'2020-06-06 13:23:01'),(4,1,5,'2020-06-06 14:52:13'),(52,13,49,'2020-06-11 19:46:25'),(53,13,50,'2020-06-11 19:46:25'),(54,13,49,'2020-06-11 19:49:52'),(55,13,50,'2020-06-11 19:49:52'),(56,1,51,'2020-06-23 17:34:42'),(57,1,52,'2020-06-23 17:34:42');
/*!40000 ALTER TABLE `Modifica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Nota`
--

LOCK TABLES `Nota` WRITE;
/*!40000 ALTER TABLE `Nota` DISABLE KEYS */;
INSERT INTO `Nota` VALUES (1,'2020-06-06 12:10:30',1,NULL,0,0,0,NULL),(95,'2020-06-11 19:46:25',98,1,0,0,0,NULL),(96,'2020-06-23 17:34:42',99,95,0,0,0,NULL);
/*!40000 ALTER TABLE `Nota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Paragrafo`
--

LOCK TABLES `Paragrafo` WRITE;
/*!40000 ALTER TABLE `Paragrafo` DISABLE KEYS */;
INSERT INTO `Paragrafo` VALUES (1,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',1,1),(2,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',1,2),(3,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',1,3),(4,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',1,4),(5,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.',1,5),(49,'Paragrafo 1',98,1),(50,'Paragrafo 2',98,2),(51,'test di sottonote',99,1),(52,'per provare la CTE',99,2);
/*!40000 ALTER TABLE `Paragrafo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Storico_descrizioni`
--

LOCK TABLES `Storico_descrizioni` WRITE;
/*!40000 ALTER TABLE `Storico_descrizioni` DISABLE KEYS */;
INSERT INTO `Storico_descrizioni` VALUES (1,1,'2020-06-06 12:10:30','Test di prova'),(4,98,'2020-06-11 19:46:25','Titolo di prova');
/*!40000 ALTER TABLE `Storico_descrizioni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Storico_paragrafi`
--

LOCK TABLES `Storico_paragrafi` WRITE;
/*!40000 ALTER TABLE `Storico_paragrafi` DISABLE KEYS */;
INSERT INTO `Storico_paragrafi` VALUES (5,5,'2020-06-06 13:23:01','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',1,5,'ivopecce'),(18,49,'2020-06-11 19:46:25','Paragrafo 1',98,1,'gpecce'),(19,50,'2020-06-11 19:46:25','Paragrafo 2',98,2,'gpecce');
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
INSERT INTO `Utente` VALUES (1,'pecce','ivo','ivopecce','5f4dcc3b5aa765d61d8327deb882cf99'),(13,'','Giuseppe','gpecce','5f4dcc3b5aa765d61d8327deb882cf99');
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

-- Dump completed on 2020-06-23 17:47:19
