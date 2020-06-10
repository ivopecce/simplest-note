<?php

    require('../include/conn.php'); //connessione al database
    session_start();    

    $id=$_POST['id'];    


    

    $sql="CALL cancella_nota(?);";
    $stmt=$mysqliobj->prepare($sql);
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $res=$stmt->get_result();


    header('Location: /');
    

?>