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


this.open_dialog = (url, options) ->
  default_options:
    width: 580
    modal: true
    customized_ajax_start: false
    autoOpen: false
    minHeight: 150
  target = $ "##{this.DIALOG_DIV_ID}"
  target.html ''
  target.dialog($.extend(default_options, options) ).dialog "open"
  my_options = default_options
  if !my_options.customized_ajax_start
    target.ajaxStart ->
      target.html '<%= image_tag asset_path("tiny_loading.gif"), :style=>"height: 24px; width:24px"%>'
  target.load(url, ->
    target.dialog "option", "position", "center"
    # move the rsvError from the parent page to dialog
    target.prepend '<div id=\"rsvErrors\"></div>'
    if $("#body .content #rsvErrors").size > 0
      $("#body .content #rsvErrors").remove
  )
