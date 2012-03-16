###
 * Usage:  given :  http://some.site.com?para1=hi
 * para1 = params("para1")     => para1 = "hi"
###
this.params = (name) ->
  name = name.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]")
  regex = new RegExp "[\\?&]#{ name }=([^&#]*)"
  regex.exec( window.location.href ) == null ? "" : results[1]

this.DIALOG_DIV_ID = "jquery_dialog"

jQuery ->
  if $("##{this.DIALOG_DIV_ID}").size == 0
    $("body").append "<div id='#{this.DIALOG_DIV_ID}' style='display:none; ' ></div>"
