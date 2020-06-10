<?php
    $host="localhost";  //Hostname server
    $user="root";   //DB_User
    $password="password"; //Password DB
    $dbname="simplestnote"; //Nome database
    //$conn=mysql_connect($host, $user, $password) or die('Errore durante la connessione al database: '.mysql_error()); //Apre una connessione al database
    //$acc=mysql_select_db($dbname, $conn) or die ('Accesso al database non riuscito: '.mysql_error()); //Accede al database
    $mysqliobj=new mysqli($host, $user, $password, $dbname);
    