jQuery ->

  if controller("important_partners")

    $(".checkbox #partner_important").each ->
      $this = $(@)
      $progress = $("<span>").insertAfter($this)
      $tick = $("<i>", class: "icon-checkmark-circle")
      $spinner = $("<i>", class: "icon-spinner")

      $this.change ->
        form = $(@).closest("form")
        $progress.html $spinner

        $.ajax form.attr("action"),
          type: "PUT"
          data: form.serializeArray()
          dataType: "script"
          success: do ($input = $(@), $progress) ->
            (data) ->
              $progress.html $tick.show()
              window.setTimeout ->
                $tick.fadeOut(1000)
              , 1500
