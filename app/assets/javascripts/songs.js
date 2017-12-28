function toggleSelected() {
  $(this).parent().parent().toggleClass("warning");
}


$(document).ready(function() {
  $("input[type=checkbox]").bind("change", toggleSelected);
});
