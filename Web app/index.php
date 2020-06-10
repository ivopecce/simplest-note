<?php
    require('include/conn.php'); //Connessione al database
    session_start();
?>
<html>
    <head>
        <link type="text/css" rel="stylesheet" href="include/css/login.css"/>
                
        <title>Simplest Note</title>
        </head>
    
    <body>
    <?php
        if(!isset($_SESSION['snUtente'])){
            require('loginform.php');
        }

        //Login effettutato
        else{
            $snUtente = $_SESSION['snUtente'];
            require('app.php');
            include('actions/store-or-update.php');
        }
        ?>
        </body>
    </html>

