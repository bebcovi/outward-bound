#= require active_admin/base
#= require jquery.turbolinks
#= require turbolinks
#= require jquery.Jcrop
#= require jquery-fileupload/basic
#
#= require_self
#
#= require_tree ./active_admin

@template = (path, object) -> JST["active_admin/templates/#{path}"](object)

@controller = (name) -> $("body").hasClass("admin_#{name}")
@action     = (name) -> $("body").hasClass(name)

jQuery ->
  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).closest("ol").append($(this).data('fields').replace(regexp, time))
    event.preventDefault()

  $("form").on "click", ".remove_fields", (event) ->
    $(this).prev("input[type=hidden]").val("1")
    $(this).closest("li").hide()
    event.preventDefault()
