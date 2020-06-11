<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <link rel="stylesheet" href="./include/css/style.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
  <script src="./include/js/app.js"></script>
  <script>
  </script>
</head>

<body>
  <div class="row">
  <h6 align="right">Loggato come: <?= $_SESSION['snUtente']['user'] ?></h6>
  <h6 align="right"><a href="logout.php">Logout</a></h6>
  <h6 align="right"><a href="eliminautente.php">Elimina utente</a></h6>
    <?php 
      $stmt=$mysqliobj->prepare("CALL lista_note(?)");
      $id=$_SESSION['snUtente']['ID_utente'];
      $stmt->bind_param("i", $id);
      $stmt->execute();
      $res=$stmt->get_result();
     
      foreach ($res as $row) : ?>
      
      <div class="col s12 m4">
        <div class="card">
          <div class="card-content click-able" id="completa" onclick="show(<?= $row['ID_nota'] ?>)">
            <div class="card-title"><?= $row['titolo'] ?? '' ?></div> <p>Ultima modifica: <?= $row['data_ultima_modifica'] ?? '' ?></p>
            <p>Proprietario: <?= $row['proprietario'] ?? '' ?></p>
            <p>Privilegi: <?= $row['privilegi'] ?? '' ?></p>
            <br/>
            <p><?= $row['testo'] ?></p>
          </div>
          <div class="card-action">
            <div class="click-able" onclick="remove(<?= $row['ID_nota'] ?>, '<?= $row['titolo'] ?>')">
              <i class="material-icons">delete</i>
            </div>

            <form class="delete-form" id="delete-form" name="delete-form" action="actions/delete.php" method="post">
              <input id="cancella" type="hidden" name="id" class="form-delete-id" value="">
            </form>
          </div>
        </div>
      </div>
    <?php endforeach; ?>
  </div>

  <div class="fixed-action-btn" onclick="add()">
    <button class="btn-floating btn-large primary">
      <i class="large material-icons">add</i>
    </button>
  </div>

  <div class="modal">
    <form name="nota" action="actions/store-or-update.php" method="post">
      <div class="modal-content">
        <input id="id" name="id" type="hidden">
        <div class="row">
          <div class="input-field col s10">
            <input id="titolo" name="titolo" type="text" placeholder="Titolo" required>
          </div>
          <div class="input-field col s2">
            <select name="=superiore" id="superiore">
            </select>
          </div>
        </div>
        <div class="input-field col s12" id="paragrafi">
        <textarea id="note" name="testo[]" class="materialize-textarea" placeholder="Note" rows="4" cols="50"></textarea>
        <input id="idparagrafo" name="idparagrafo[]" type="hidden">
          <!-- <textarea id="note" name="testo" class="materialize-textarea" placeholder="Note" rows="4" cols="50"></textarea> -->
          <!-- <input type="button" onclick="modifyForm();" value="Inserisci piu' paragrafi" /> -->
          <input name="addF" type="button" id="addF" value="Aggiungi Paragrafo" onclick="addfield();" />
          <br/>
          <!-- <input name="remF" type="button" id="remF" value="Rimuovi Paragrafo" onclick="modifyForm(-1);" /> -->
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="waves-effect waves-light btn-flat modal-close" onclick="window.location.reload();">Cancel</button>
        <button type="submit" class="waves-effect btn primary">Save</button>
      </div>
    </form>
  </div>

</body>