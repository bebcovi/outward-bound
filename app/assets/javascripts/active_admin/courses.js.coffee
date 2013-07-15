jQuery ->

  if controller("courses")

    if action("show")

      $(".panel h3").slice(1, 2).text("English")
      $(".panel h3").slice(2, 3).text("Croatian")
