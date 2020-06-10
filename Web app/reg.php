<?php
                require('include/conn.php'); //connessione al database
                session_start();
                if(isset($_POST['user'])){
                    $user=$_POST['user'];
                    $password=MD5($_POST['password']);
                    $cognome=$POST['cognome'];
                    $nome=$_POST['nome'];
                    
				    $m_query = "CALL aggiungi_utente(\"".$cognome."\", \"".$nome."\", \"".$user."\", \"".$password."\")";
                
                    $mRisultato = $mysqliobj->query($m_query);

                    if (!$mRisultato) {
                       echo "Aggiunta utente fallita: (" . $mysqliobj->errno . ") " . $mysqliobj->error;
                    }
                    else{
                            echo " <script type='text/javascript'>

                                        confirm('Account registrato con successo');

                                    </script>";
                    }


             }

             header('Location: ' . $_SERVER['HTTP_REFERER']);

 ?>