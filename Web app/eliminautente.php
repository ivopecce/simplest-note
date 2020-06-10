<?php
	require('include/conn.php'); //connessione al database
	session_start();
	
	if(isset($_SESSION))
	{
        $id_utente=$_SESSION['snUtente']['ID_utente'];
        $sql="CALL cancella_utente(?);";
        $stmt=$mysqliobj->prepare($sql);
        $stmt->bind_param("i", $id_utente);
        $stmt->execute();
        $res=$stmt->get_result();
        session_destroy();
        header('Location: ' . $_SERVER['HTTP_REFERER']);
		
	}
	else
	{
		header('Location: ' . $_SERVER['HTTP_REFERER']);
	}

?>
