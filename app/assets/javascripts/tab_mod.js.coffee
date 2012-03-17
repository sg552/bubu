this.setTab = (m,n) ->
  menus=$("#tab#{m} li")
  divs=$("#tablist#{m} div")
  for single_menu, i in menus
    $(menus[i]).attr("class", if i==n then "now" else "" )
    $(divs[i]).css("display", if i==n then "block" else "none")
  return null
