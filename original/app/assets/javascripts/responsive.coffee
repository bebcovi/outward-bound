jQuery ->
  $('#title').fitText 1.025,
    maxFontSize: '100px'
    minFontSize: '34px'

  $('#right .show').on 'click', (e) ->
    e.preventDefault()
    $('#left, #right').toggleClass 'active-sidebar'
