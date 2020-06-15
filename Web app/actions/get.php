<?php
require('../include/conn.php'); //Connessione al database
session_start();


$id = $_REQUEST['id'];


$id_utente=$_SESSION['snUtente']['ID_utente'];
$query = "SELECT privilegi FROM Gestisce WHERE privilegi IN ('proprietario', 'scrittura') and (ID_utente=? and ID_nota=?);";
$stmt=$mysqliobj->prepare($query);  
$stmt->bind_param("ii", $id_utente,$id);
$stmt->execute();
$res=$stmt->get_result();
$permessi=$res->fetch_assoc();
$p=$permessi['privilegi'];

if($p){
    $sql="SELECT titolo FROM Nota INNER JOIN Descrizione ON Nota.ID_descrizione=Descrizione.ID_descrizione WHERE ID_nota=?;";
    $stmt=$mysqliobj->prepare($sql);  
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $res=$stmt->get_result();
    $nota = $res->fetch_assoc();


    //esegue la query che restituisce i paragrafi e invia i dati formattati al js
    $sql="CALL lista_paragrafi(?)";
    $stmt=$mysqliobj->prepare($sql);  
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $res=$stmt->get_result();
    // $campi = $res->fetch_assoc();
    $campi['id'] = array();
    $campi['titolo'] = array();
    array_push($campi['id'], $id);
    array_push($campi['titolo'], $nota['titolo']);
    $campi['idparagrafo'] = array();
    $campi['testo'] = array();
    $campi['posizione'] = array();
    while($r = $res->fetch_assoc()){

        array_push($campi['idparagrafo'], $r['idparagrafo']);
        array_push($campi['testo'], $r['testo']);
        array_push($campi['posizione'], $r['posizione']);
    }

    
    
}
    header('Content-type: text/json');
    echo json_encode(['data' => $campi]);
    

?>
