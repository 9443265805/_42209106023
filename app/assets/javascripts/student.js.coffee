# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
 
  endquiz = ->
    $("[name='commit']").click()
    return

  $("#Printme").click ->
    mywin = undefined
    mywin = window.open()
    mywin.document.write $("#printable").html()
    mywin.print()
    mywin.close()
    return

  $("#timer").countdown
    until: 10 #$("#dur").data("duration")
    onExpiry: endquiz
    format: "HMS"

  return
