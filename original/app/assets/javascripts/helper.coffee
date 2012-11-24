jQuery ->
  $('[alt=logo]').each ->
    $(@).next().attr 'target', '_blank'
    $(@).wrap '<div class="img">'

  $('.error').each ->
    $(@).prev().addClass 'error'

  $('p img').unwrap()
