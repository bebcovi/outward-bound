jQuery ->

  if controller("carousel_photos")

    if action("edit")

      # Unable to do this in Ruby
      $("#page_title").text("Crop")

      aspectRatio = 940 / 300

      x = $("#carousel_photo_crop_x").val()
      y = $("#carousel_photo_crop_y").val()
      w = $("#carousel_photo_crop_w").val()
      h = $("#carousel_photo_crop_h").val()

      x1 = x
      y1 = y
      x2 = w
      y2 = y1 + h

      updateCropInfo = (coordinates) ->
        $("#carousel_photo_crop_x").val(coordinates.x)
        $("#carousel_photo_crop_y").val(coordinates.y)
        $("#carousel_photo_crop_w").val(coordinates.w)
        $("#carousel_photo_crop_h").val(coordinates.h)

      $("#cropbox").Jcrop
        aspectRatio: aspectRatio
        setSelect: [x1, y1, x2, y2]
        bgOpacity: .2
        onSelect: updateCropInfo
