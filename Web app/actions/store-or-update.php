<?php

  
    require('../include/conn.php'); //Connessione al database
    session_start();


    $user=$_SESSION['snUtente']['user'];
    $titolo = $_POST['titolo'];
    $idnota=$_POST['id'];
    $id_utente=$_SESSION['snUtente']['ID_utente'];

    if(!$idnota){

        $sql="CALL nuova_nota(?, ?, @_id1);";
        $stmt=$mysqliobj->prepare($sql);
        $stmt->bind_param("ss", $titolo,$user);
        $stmt->execute();
        $select = $mysqliobj->query('SELECT @_id1');
        $result = $select->fetch_assoc();
        $res = $result['@_id1'];
        
        
        if( !empty($_POST["testo"][0]) ) {
            for($i=0; $i<count($_POST["testo"]); $i++){
                $t = $_POST["testo"][$i];
                $sql="CALL nuovo_paragrafo(?, ?, ?);";
                $stmt=$mysqliobj->prepare($sql);
                $stmt->bind_param("sii", $t,$res,$id_utente);
                $stmt->execute();
            }
        }
    }

    else{
        $sql="SELECT Descrizione.ID_descrizione, titolo FROM Descrizione INNER JOIN Nota ON Nota.ID_Descrizione=Descrizione.ID_descrizione WHERE Nota.ID_nota=?;";
        $stmt=$mysqliobj->prepare($sql);
        $stmt->bind_param("i", $idnota);
        $stmt->execute();
        $res=$stmt->get_result();
        $des=$res->fetch_assoc();

        if($des['titolo']!=$titolo){
        $sql="CALL modifica_titolo(?, ?)";
        $stmt=$mysqliobj->prepare($sql);
        $stmt->bind_param("is", $des['ID_descrizione'],$titolo);
        $stmt->execute();
        }

        for($i=0; $i<count($_POST["testo"]); $i++){
            $idparagrafo=$_POST['idparagrafo'][$i];
            $t = $_POST["testo"][$i];
            if(!$idparagrafo){
                $sql="CALL nuovo_paragrafo(?, ?, ?);";
                $stmt=$mysqliobj->prepare($sql);
                $stmt->bind_param("sii", $t,$des["ID_descrizione"],$id_utente);
                $stmt->execute();
            }
            else{
                if($t){
                    $sql="CALL modifica_paragrafo(?, ?, ?);";
                    $stmt=$mysqliobj->prepare($sql);
                    $stmt->bind_param("isi", $idparagrafo,$t,$id_utente);
                    $stmt->execute();
                }
                else{
                    $sql="DELETE FROM Paragrafo WHERE ID_paragrafo=?;";
                    $stmt=$mysqliobj->prepare($sql);
                    $stmt->bind_param("i", $idparagrafo);
                    $stmt->execute();
                }
            }
            
            
            
            
        }

    }
      

header('Location: /');
?>