<?php
	require('include/conn.php'); //connessione al database
	session_start();
	
	if(isset($_POST['user']) && isset($_POST['password']))
	{
		$user = $_POST['user'];
		$password = MD5($_POST['password']);
		
		$m_query = "SELECT ID_utente,cognome,nome,user FROM Utente WHERE user = '" .$user ."' && password = '" .$password ."';";

		
		$mRisultato = $mysqliobj->query($m_query);
		
		if(mysqli_num_rows($mRisultato) > 0){
			echo "Login effettuato";
			$res = mysqli_fetch_array($mRisultato);
			$snUtente = array('ID_utente' => $res['ID_utente'],
							'user' => $res['user'],
							'nome' => $res['nome'],
							'cognome' => $res['cognome']);
			$_SESSION['snUtente'] = $snUtente;
			header('Location: ' . $_SERVER['HTTP_REFERER']);

		
		}
		else{
			echo "login fallito";
			header('Location: ' . $_SERVER['HTTP_REFERER']);
		}
	}
	else
	{
		header('Location: ' . $_SERVER['HTTP_REFERER']);
	}

?>
