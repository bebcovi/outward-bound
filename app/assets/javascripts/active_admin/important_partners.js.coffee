jQuery ->

  if controller("important_partners")

    $(".checkbox #partner_important").change ->
      form = $(@).closest("form")
      $.ajax form.attr("action"),
        type: "PUT"
        data: form.serializeArray()
        dataType: "script"
