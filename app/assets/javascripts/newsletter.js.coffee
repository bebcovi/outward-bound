do ($ = jQuery) ->

  if document.width > 560
    $(".newsletter_link").fancybox
      type: "ajax"
      autoSize: false
      autoHeight: true
      width: 460
      padding: 40
      beforeShow: ->
        @wrap.find("form").on "submit", ->
          $.fancybox.close()
