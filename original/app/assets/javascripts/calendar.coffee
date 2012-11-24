jQuery ->
  $('#calendar').on 'click', '.ec-calendar-header a', (event) ->
    event.preventDefault()
    $.get $(@).attr('href'), (data) ->
      $('.ec-calendar').replaceWith $(data).find('.ec-calendar')
