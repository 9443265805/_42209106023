# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  $("#datepicker").datepicker
    changeMonth: true
    minDate: 0
    changeYear: true
    altField: "#quiz_date"
    altFormat: "yy-mm-dd"

  $("#starttimepicker").timepicker
  	altField: "#quiz_starttime"
  
  $("#endtimepicker").timepicker
  	altField: "#quiz_endtime"
  
  return
