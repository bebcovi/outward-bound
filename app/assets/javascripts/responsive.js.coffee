jQuery ->

  $html = $("html")

  $(".nav_expander").on "click", (e) ->
    e.preventDefault()
    $html.toggleClass("off-canvas")
