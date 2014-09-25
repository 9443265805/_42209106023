# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  $("#quiz_starttime").val("")   
  $("#quiz_endtime").val("")
  $("#datepicker").val($("#quiz_date").val()) if $("#quiz_date").val() isnt null  and $("#quiz_date").val() isnt  ""
  if $("#quiz_starttime").val() isnt null and $("#quiz_starttime").val() isnt "" and $("#quiz_endtime").val() isnt null and $("#quiz_starttime").val() isnt ""
    tstart = new Date($("#quiz_starttime").val())
    tend = new Date($("#quiz_endtime").val())
    $("#starttimepicker").val ("0" + tstart.getHours()).slice(-2) + ":" + ("0" + tstart.getMinutes()).slice(-2)
    $("#endtimepicker").val ("0" + tend.getHours()).slice(-2) + ":" + ("0" + tend.getMinutes()).slice(-2)
  $("#datepicker").datepicker
    changeMonth: true
    minDate: 0
    changeYear: true
    altField: "#quiz_date"
    altFormat: "yy-mm-dd"

  $("#starttimepicker").timepicker altField: "#quiz_starttime"
  $("#endtimepicker").timepicker altField: "#quiz_endtime"
  return
