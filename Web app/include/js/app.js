$(document).ready(() => {
  $('.modal').modal()
  $('select').formSelect()
})

const setForm = ({id, titolo, testo}) => {
  $('#id').val(id)
  $('#titolo').val(titolo)
  $('#note').val(testo)
}

const setForm1 = ({id, titolo, idparagrafo, testo, posizione }) => {
  $('#id').val(id[0])
  $('#titolo').val(titolo[0])
  document.getElementById('note').remove()
  for(var i=0; i<idparagrafo.length; i++){
    var f = '<textarea id="note[]" name="testo[]" class="materialize-textarea" placeholder="Note" rows="4" cols="50" ></textarea><input id="idparagrafo" name="idparagrafo[]" type="hidden">';
    document.getElementById('paragrafi').insertAdjacentHTML('beforeend', f);
    var x = document.getElementsByName('testo[]');
    var y = document.getElementsByName('idparagrafo[]');
    $(x[i]).val(testo[i]);
    $(y[i]).val(idparagrafo[i]);
    
  }
  // $('#note').val(testo);

  
}

const add = () => {
  setForm({})
  $('.modal').modal('open')
}

const show = id => {

  $.getJSON(`actions/get.php?id=${id}`, ({ data }) => {
    setForm1(data)
    $('.modal').modal('open')
  })
  
}

const remove = (id, titolo) => {
  const answer = confirm(`Sei sicuro di voler eliminare ${titolo}?`)

  if (answer) {
    document.getElementById("cancella").value=id;
    document.forms["delete-form"].submit();
  }
}



function addfield(){

  var f = '<textarea id="note" name="testo[]" class="materialize-textarea" placeholder="Note" rows="4" cols="50"></textarea><input id="idparagrafo" name="idparagrafo[]" type="hidden">';

  document.getElementById('paragrafi').insertAdjacentHTML('beforeend', f);

 

}


