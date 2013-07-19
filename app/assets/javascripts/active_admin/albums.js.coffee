jQuery ->

  if controller("albums")

    progressBar = new ProgressBar($("li.input.album_photos_file"))

    $("li.input.album_photos_file input")
      .attr("multiple", "multiple")
      .fileupload
        dataType: "script"
        add: (event, data) ->
          progressBar.addTask()
          data.submit()
        done: (event, data) ->
          progressBar.completeTask()
        stop: (event) ->
          progressBar.reset()

    $("form").on "click", ".delete_photo", (event) ->
      $(@).prev("input[type='hidden']").val("true")

      form = $(@).closest("form")
      $.ajax form.attr("action"),
        type: "PUT"
        data: form.serializeArray()
        dataType: "script"

      event.preventDefault()

class ProgressBar

  constructor: (@location) ->
    @value = $(template("progress_bar"))
    @location.append(@value)

    @total = 0
    @current = 0

  addTask: =>
    @total += 1
    @update()

  completeTask: =>
    @current += 1
    @update()

  update: =>
    @value.remove()
    @value = $(template("progress_bar", current: @current, total: @total))
    @location.append(@value)

  reset: =>
    @value.remove()
    @value = $(template("progress_bar"))
    @location.append(@value)

    @total = 0
    @current = 0
