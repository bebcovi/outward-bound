jQuery ->
  id = '[id^=application_health]'

  $radios_yes = $("#{id}[value=yes]")
  $radios_no = $("#{id}[value=no]")
  $textareas = $("textarea#{id}")

  $textareas.hide()

  $radios_yes.on 'click', ->
    index = $radios_yes.index $(@)
    $textareas.eq(index).show()

  $radios_no.on 'click', ->
    index = $radios_no.index $(@)
    $textareas.eq(index).hide()
