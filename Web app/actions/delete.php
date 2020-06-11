<?php

    require('../include/conn.php'); //connessione al database
    session_start();    

    $id=$_POST['id'];    


    

    $sql="CALL cestina_nota(?, ?);";
    $stmt=$mysqliobj->prepare($sql);
    $stmt->bind_param("ii", $id, $_SESSION['snUtente']['ID_utente']);
    $stmt->execute();
    $res=$stmt->get_result();


    header('Location: /');
    

?>