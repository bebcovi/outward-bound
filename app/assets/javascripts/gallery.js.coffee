do ($ = jQuery) ->

  if $("html").outerWidth() > $(".container").first().outerWidth()
    $(".album_photos").find("a")
      .attr("rel", "gallery")
      .fancybox
        openEffect: "elastic"
        closeEffect: "none"
        nextEffect: "fade"
        prevEffect: "fade"
