jQuery ->

  if controller("posts")

    showInputs = (locale) ->
      $("#post_title_#{locale}").closest("li").show()
      $("#post_body_#{locale}").closest("li").show()

    hideInputs = (locale) ->
      $("#post_title_#{locale}").closest("li").hide()
      $("#post_body_#{locale}").closest("li").hide()

    for locale in ["hr", "en"]

      localeCheckbox = $("#post_#{locale}")

      hideInputs(locale) if localeCheckbox.is(":not(:checked)")
      localeCheckbox.change ->
        locale = $(@).attr("id").match(/hr|en/)[0]
        if $(@).is(":checked") then showInputs(locale) else hideInputs(locale)


   $(".post_album_photos_file input[type='file']").change ->
     $(@).closest("form")
       .data("remote", true)
       .submit()
       .removeData("remote")

   $(".delete_photo").click (event) ->
     event.preventDefault()
