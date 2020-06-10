<?php
	require('include/conn.php'); //connessione al database
	session_start();
	
	if(isset($_SESSION))
	{
        session_destroy();
        header('Location: ' . $_SERVER['HTTP_REFERER']);
		
	}
	else
	{
		header('Location: ' . $_SERVER['HTTP_REFERER']);
	}

?>
