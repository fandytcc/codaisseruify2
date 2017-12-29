function toggleSelected() {
  $(this).parent().parent().toggleClass("warning");
}

function removeSong(event){
  event.preventDefault();
  $(".warning").remove();
}

$(document).ready(function() {
  $("input[type=checkbox]").bind("change", toggleSelected);
  $("#delete").bind("click", removeSong);
});
