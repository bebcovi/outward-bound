do ($ = jQuery) ->

  $form                 = $("form.new_post")

  $form.on "click", ".add_fields", (event) ->
    event.preventDefault()

    $this = $(@)
    time  = new Date().getTime()
    re    = new RegExp $this.data("id"), "g"

    $this.before $this.data("fields").replace(re, time)

  $form.on "click", ".remove_fields", (event) ->
    event.preventDefault()

    $this = $(@)

    $this.prev("[type=hidden]").val("1")
    $this.closest(".attachment").hide()

#   fileSystemSupported   = window.File and window.FileReader and window.FileList and window.Blob

#   class NotAnImageException
#     constructor: (filename) ->
#       @message  = "nije slika"
#       @filename = filename
#       @toString = ->
#         "#{@filename} #{@message}."

#   if $form.length and fileSystemSupported

#     $fileInput  = $form.find("[type=file][multiple]")
#     $imgPreview = $form.find(".img-preview")

#     $fileInput.on "change", (event) ->
#       if $(@).val()
#         files       = event.target.files
#         $filesList  = $("<ul>").appendTo($imgPreview)

#         $imgPreview.find(".flash.alert").remove()

#         try
#           for file in files
#             unless file.type.match("image.*")
#               throw new NotAnImageException(file.name)

#             $fileImg  = $("<img>")
#             $fileItem = $("<li>").append($fileImg).appendTo($filesList)

#             reader = new FileReader

#             reader.onload = do ($fileImg) -> (e) ->
#               img = $fileImg[0]

#               $fileImg.hide()
#               img.src = e.target.result
#               img.onload = -> $fileImg.fadeIn()

#             reader.readAsDataURL(file)

#         catch err
#           $errorMsg = $("<div>", class: "flash alert").text(err)

#           $fileInput.val("")
#           $imgPreview.empty()

#           $errorMsg.appendTo($imgPreview).hide().slideDown()
