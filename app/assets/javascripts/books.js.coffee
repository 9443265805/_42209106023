# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  $("#addfile").hide()
  $("#book_booktype").change ->
    if $(this).val() is "ebook"
      $("#addfile").show()
    else
      $("#addfile").hide()
      $("#book_efile").val("")
    return

  return

