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
#2 - Estrazione della data di ultima modifica della nota
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
#5 - Visualizzazione del testo di una specifica nota
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
#1 - Inserimento di un utente
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `archivia_nota`(_ID_nota integer, _ID_utente integer)
BEGIN
	IF (SELECT privilegi FROM Gestisce WHERE ID_nota=_ID_nota AND ID_utente=_ID_utente AND privilegi='proprietario') THEN
    BEGIN
		UPDATE Nota SET archivio=1 WHERE ID_nota=_ID_nota;
	END;
    ELSE
    BEGIN
		SIGNAL SQLSTATE '45000' SET message_text = "L'utente non `e proprietario della nota";
    END;
    END IF;
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
/*!50003 DROP PROCEDURE IF EXISTS `cestina_nota` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cestina_nota`(_ID_nota integer, _ID_utente integer)
BEGIN
	DECLARE _privilegi char(15);
    SET _privilegi = (SELECT privilegi FROM Gestisce WHERE ID_nota=_ID_nota AND ID_utente=_ID_utente AND privilegi='proprietario');
	IF _privilegi='proprietario' THEN
    BEGIN
		UPDATE Nota SET cestino=1 WHERE ID_nota=_ID_nota;
	END;
    ELSE
    BEGIN
		SIGNAL SQLSTATE '45000' SET message_text = "L'utente non `e proprietario della nota";
    END;
    END IF;
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
    INSERT INTO Allegato(descrizione, allegato, ID_descrizione) VALUES (_desc, p_allegato, _ID_desc);
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
#3 - Estrazione della lista delle note presenti nel blocco appunti di un utente con titolo e data di ultima modifica
#In aggiunta a quanto richiesto, viene visualizzato anche il testo della nota
	SELECT Nota.ID_nota, titolo, visualizza_testo_nota(Nota.ID_nota) AS testo, nota_ultima_modifica(Nota.ID_nota) as data_ultima_modifica, (SELECT user FROM Utente INNER JOIN Gestisce ON Utente.ID_utente=Gestisce.ID_Utente WHERE Gestisce.ID_nota=ID_nota and privilegi='proprietario' LIMIT 1) AS proprietario, privilegi
    FROM Gestisce INNER JOIN ((Nota INNER JOIN Descrizione ON Nota.ID_descrizione=Descrizione.ID_descrizione)) ON Gestisce.ID_nota=Nota.ID_nota
	WHERE Gestisce.ID_utente=_ID_utente AND Nota.cestino=0;
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
#7 - Aggiornamento di un paragrafo di testo da parte di uno specifico utente
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
#9 - Concessione ad un unutente dei privilegi su una nota
#In aggiunta alla specifica, tale procedura permette anche di eliminare i permessi
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
#4 - Creazione di una nuova nota nel blocco appunti	
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
#6 - Accodamento di un paragrafo di testo a una nota
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
#8 - Ricerca di una nota in base al testo presente nel contenuto
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
#8 - Ricerca di una nota in base al testo presente nei tag
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
#8 - Ricerca di una nota in base al testo presente nel titolo
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
/*!50003 DROP PROCEDURE IF EXISTS `ripristina_archivio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ripristina_archivio`(_ID_nota integer, _ID_utente integer)
BEGIN
	IF (SELECT privilegi FROM Gestisce WHERE ID_nota=_ID_nota AND ID_utente=_ID_utente AND privilegi='proprietario') THEN
    BEGIN
		UPDATE Nota SET archivio=0 WHERE ID_nota=_ID_nota;
	END;
    ELSE
    BEGIN
		SIGNAL SQLSTATE '45000' SET message_text = "L'utente non `e proprietario della nota";
    END;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ripristina_cestino` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ripristina_cestino`(_ID_nota integer, _ID_utente integer)
BEGIN
	IF (SELECT privilegi FROM Gestisce WHERE ID_nota=_ID_nota AND ID_utente=_ID_utente AND privilegi='proprietario') THEN
    BEGIN
		UPDATE Nota SET cestino=0 WHERE ID_nota=_ID_nota;
	END;
    ELSE
    BEGIN
		SIGNAL SQLSTATE '45000' SET message_text = "L'utente non `e proprietario della nota";
    END;
    END IF;
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
#10 - Impostazione di una nota come sotto-nota di un'altra
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
#12 - Visualizzazione dello storico delle modifiche di un determinato paragrafo
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
#11 - Visualizzazione di tutte le sotto-note di una data nota
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

-- Dump completed on 2020-06-11 20:03:20
