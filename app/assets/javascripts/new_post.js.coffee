# do ($ = jQuery) ->

#   $form                 = $("form.new_post")
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
