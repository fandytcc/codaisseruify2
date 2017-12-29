function toggleSelected() {
  $(this).parent().parent().toggleClass("warning");
}

function nextSongId(){
  return $(".song").length + 1;
}

function createSong(title){

  var checkboxId = "song-" + nextSongId();

  var label = $("<label></label>")
    .attr("for", checkboxId)
    .html(title);

  var checkbox = $("<input type="checkbox" value="1" />")
    .attr("id", checkboxId)
    .bind("change", toggleSelected);

  var tableRow = $("<tr class="song"></tr>")
    .append($("<td>").append(checkbox))
    .append($("<td>").append(label));

  $("#songList").append(tableRow);
}

function submitSong(event){
  event.preventDefault();
  var title = $("song_title").val();
  createSong(title);
  $("#song_title").val(null);
}

function removeSong(event){
  event.preventDefault();
  $(".warning").remove();
}

$(document).ready(function() {
  $("input[type=checkbox]").bind("change", toggleSelected);
  $("form").bind("submit", submitSong);
  $("#delete").bind("click", removeSong);
});
