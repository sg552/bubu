###
 * Usage:  given :  http://some.site.com?para1=hi
 * para1 = params("para1")     => para1 = "hi"
###
this.params = (name) ->
  name = name.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]")
  regex = new RegExp "[\\?&]#{ name }=([^&#]*)"
  regex.exec( window.location.href ) == null ? "" : results[1]

DIALOG_DIV_ID = "jquery_dialog"


###
  usage: open_dialog("http://", { width: 600}  )
###
this.open_dialog = (url, options) ->
  default_options=
    width: 580
    modal: true
    customized_ajax_start: false
    autoOpen: false
    minHeight: 150
  target = $ "##{DIALOG_DIV_ID}"
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
    if $("#body .content #rsvErrors").size() > 0
      $("#body .content #rsvErrors").remove()
  )
###
  usage:
  1. generic and simple:
   close_dialog()
  2. more specific :
   close_dialog("jquery_dialog")
###
this.close_dialog = ( div_id = DIALOG_DIV_ID ) ->
  target = $("#"+ div_id)
  target.dialog("close")
  ## restore the rsvError div to parent page.
  if($("#body .content #rsvErrors").size()==0)
    $('#body .content').append('<div id=\"rsvErrors\"></div>')
  target.html ''

jQuery ->
  $("body").append "<div id='#{DIALOG_DIV_ID}' style='display:none; ' ></div>"
  # moved from new.js
  $('.sidelist').mousemove ->
    $(this).find('.i-list').show()
    $(this).find('h3').addClass('hover')
  $('.sidelist').mouseleave ->
    $(this).find('.i-list').hide()
    $(this).find('h3').removeClass('hover')
