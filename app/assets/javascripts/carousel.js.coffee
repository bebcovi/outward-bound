do ($ = jQuery) ->

  $(".carousel").find(".inner").carouFredSel
    scroll:
      fx: "crossfade"

    items:
      visible: 1
      height: 300
      width: 940
