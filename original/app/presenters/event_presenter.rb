# encoding: utf-8

class EventPresenter < BasePresenter
  presents :event

  def name
    event.name
  end

  def date_range
    "#{l(event.start_at, locale: :hr)} - #{l(event.end_at, locale: :hr)}"
  end

  def course
    link_to(event.course, event.course) if event.course
  end

  def color
    color_name(event.color)
  end

  def admin_links
    content_tag :p do
      edit_button("Izmjeni", edit_event_path(event)) + " | " + delete_button("Izbriši", event_path(event))
    end
  end
end
