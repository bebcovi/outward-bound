jQuery ->

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
        timeoutDuration: 3000

      prev: ".prev"
      next: ".next"

  # video

  $playVideo = $(".play_video")

  if $playVideo.length
    $playVideo.fancybox
      helpers:
        media: {}

  # tweets

  $tweets = $(".tweets").find("li")
  $currentTweet = $tweets.last()
  refreshInterval = 10000

  if $tweets.length
    unless $tweets.length is 1
      do ->
        $currentTweet.fadeOut()

        if $currentTweet.next().length
          $currentTweet = $currentTweet.next()
        else
          $currentTweet = $currentTweet.siblings().first()

        console.log arguments.callee

        $currentTweet.fadeIn()

        setTimeout arguments.callee, refreshInterval
    else
      $tweets.show()
