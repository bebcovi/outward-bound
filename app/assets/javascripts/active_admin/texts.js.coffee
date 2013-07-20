jQuery ->

  if controller("texts")

    $(".action_item").last().remove()

    if action("show")
      text = $("#page_title").text()
    else
      text = $(".breadcrumb a").last().text()

    switch text
      when "Home introduction"    then $("li#home").addClass("current")
      when "Courses introduction" then $("li#courses").addClass("current")
      else                             $("li#about_us").addClass("current")
