function toggleSelected() {
  var checkbox = this;
  var tableRow = $(checkbox).parent().parent();

  var songId = tableRow.data('id');
  var isSelected = !tableRow.hasClass("success");

  $.ajax({
    type: "PUT",
    url: "/songs/" + songId + ".json",
    data: JSON.stringify({
      song: { selected: isSelected }
    }),
    contentType: "application/json",
    dataType: "json"})

   .fail(function(error) {
     console.log(error);
     alert("Could not change the selected status of this song");
   })

   .done(function(data){
     console.log(data);

     tableRow.toggleClass("success", data.selected);
   });
}

function createSong(title){
  var newSong = { title: title, selected: false };

  $.ajax({
    type: "POST",
    url: "/songs.json",
    data: JSON.stringify({
      song: newSong
    }),
    contentType: "application/json",
    dataType: "json"})

  .done(function(data) {
    console.log(data);

    var checkboxId = data.id;

    var label = $('<label></label')
      .attr('for', checkboxId)
      .html(title);

    var checkbox = $('<input>')
      .attr('type', 'checkbox')
      .attr('id', checkboxId)
      .val(1)
      .bind("change", toggleSelected);

    var tableRow = $("<tr></tr>")
      .addClass('song')
      .attr('data-id', checkboxId)
      .append($('<td>').append(checkbox))
      .append($('<td>').append(label));

    $("#songList").append( tableRow );
  })

  .fail(function(error) {
    console.log(error);

    error_message = error.responseText;
    showError(error_message);
  });
}

function showError(message) {
  var errorHelpBlock = $('<span class="help-block"></span>')
    .attr('id', 'error_message')
    .text(message);

  $("#formgroup-title")
    .addClass('has-error')
    .append(errorHelpBlock);
}

function resetErrors(){
  $("#error_message").remove();
  $("#formgroup-title").removeClass('has-error');
}

function submitSong(event){
  event.preventDefault();
  resetErrors();
  var title = $("#song_title").val();
  createSong(title);
  $("#song_title").val(null);
}

function removeSong(event){
  event.preventDefault();

  $.each($(".success"), function(index, tableRow){
    songId = $(tableRow).data('id');
    deleteSong(songId);
  });
}

function deleteSong(songId){
  $.ajax({
    type: "DELETE",
    url: "/songs/" + songId + ".json",
    contentType: "application/json",
    dataType: "json"})

  .done(function(data) {
    $('tr[data-id="'+ songId +'"]').remove();
  });
}

$(document).ready(function() {
  $("input[type=checkbox]").bind('change', toggleSelected);
  $("form").bind('submit', submitSong);
  $("#delete").bind('click', removeSong);
});
