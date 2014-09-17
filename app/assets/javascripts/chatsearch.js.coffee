$(document).ready ->
  $("#chatTable").hide()
  $("#searchName").keyup ->
    chatname = undefined
    idname = undefined
    $("#chatTable").hide()
    $("#chatTable").children().find("tr").hide()
    chatname = $(this).val()
    idname = $("#" + chatname)
    if idname.text() is chatname and chatname isnt ""
      $("#chatTable").show()
      idname.parent("tr").show()
    return

  return
