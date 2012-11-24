# encoding: utf-8

module ApplicationHelper
  def navigation_pages
    pages = ["home", "about", "courses", "business", "gallery", "faq"]
    pages.map do |name|
      title = t("#{name}.index.page_title")
      route = {controller: name, action: "index"}
      options = (params[:controller] != route[:controller] ? {} : {class: "active"})
      link_to title, route, options
    end
  end

  def smart_render(text)
    Redcarpet::Render::SmartyPants.render(text).html_safe
  end

  def edit_icon()   content_tag(:i, "", class: "icon-edit")   end
  def delete_icon() content_tag(:i, "", class: "icon-remove") end
  def new_icon()    content_tag(:i, "", class: "icon-plus")   end

  def edit_button(string, path, options = {})
    link_to "#{edit_icon} #{string}".html_safe, path, {class: "edit"}.merge(options)
  end
  def delete_button(string, path, options = {})
    link_to "#{delete_icon} #{string}".html_safe, path, {method: :delete, confirm: "Jeste li sigurni?", class: "delete"}.merge(options)
  end
  def new_button(string, path, options = {})
    link_to "#{new_icon} #{string}".html_safe, path, {class: "new"}.merge(options)
  end

  def present(object)
    klass = "#{object.class}Presenter".constantize
    presenter = klass.new(object, self)
    yield presenter
  end

  def event_calendar
    calendar(event_calendar_options) do |c|
      link_to_if c[:event].course, c[:event].name, c[:event].course
    end.html_safe
  end

  private

  def event_calendar_options
    {
      year: @date.year,
      month: @date.month,
      event_strips: Event.event_strips_for_month(@date, 1),
      month_name_text: l(@date, format: "%B %Y"),
      previous_month_text: "← #{month_link(@date.prev_month)}",
      next_month_text: "#{month_link(@date.next_month)} →",
      first_day_of_week: 1,
      height: 300
    }
  end

  def month_link(date)
    link_to l(date, :format => "%B"), :month => date.month, :year => date.year
  end
end
