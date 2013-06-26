jQuery ->

  $(".post_long").find(".photos").find("a")
    .attr("rel", "gallery")
    .fancybox
      openEffect: "elastic"
      closeEffect: "none"
      nextEffect: "fade"
      prevEffect: "fade"
