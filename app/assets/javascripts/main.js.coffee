do ($ = jQuery) ->

  # jQuery

  $.fx.speeds["_default"] = 200

  # slabtext

  $heroUnit = $(".hero-unit")

  if $heroUnit.length
    $heroUnit.find("h1, .lead").slabText()

  # carousel

  $carousel = $(".carousel")

  if $carousel.length
    $carousel.find(".inner").carouFredSel
      scroll:
        fx: "slide"

      items:
        visible: 1
        height: 300
        width: 940

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
