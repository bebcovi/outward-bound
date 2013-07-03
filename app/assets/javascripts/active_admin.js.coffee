#= require active_admin/base
#= require jquery.turbolinks
#= require turbolinks
#= require jquery.Jcrop
#
#= require_self
#
#= require_tree ./active_admin

@template = (path, object) -> JST["active_admin/templates/#{path}"](object)

@controller = (name) -> $("body").hasClass("admin_#{name}")
@action     = (name) -> $("body").hasClass(name)
