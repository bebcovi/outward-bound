do ($ = jQuery) ->

  # jQuery

  $.fx.speeds["_default"] = 200

  # carousel

  $carousel = $(".carousel")

  if $carousel.length
    $carousel.find(".inner").carouFredSel
      responsive: true

      scroll:
        fx: "slide"

      items:
        visible: 1
        height: 300
        width: 960 - 2*12 - 2*12

      auto:
        timeoutDuration: 5000

      prev: ".prev"
      next: ".next"

  # video

  $playVideo = $(".play_video")

  if $playVideo.length
    $playVideo.fancybox
      helpers:
        media: {}

  # tweets

  $currentTweet = $(".tweets").find("li:last-child")
  refreshInterval = 10000

  do ->
    $currentTweet.fadeOut()

    if $currentTweet.next().length
      $currentTweet = $currentTweet.next()
    else
      $currentTweet = $currentTweet.siblings().first()

    $currentTweet.fadeIn()

    setTimeout arguments.callee, refreshInterval
