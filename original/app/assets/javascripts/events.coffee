jQuery ->
  $el = $('#event_color')
  $preview = $('<span id="color_preview"></span>')
  $el.after $preview
  $preview.css 'background', $el.val()
  $el.on 'change', ->
    $preview.css 'background', $el.val()
