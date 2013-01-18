do ($ = jQuery) ->

  $mainNav = $(".main.nav")

  $(".nav_expander").on "click", (e) ->
    e.preventDefault()
    $mainNav.toggleClass("expanded")
