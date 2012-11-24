# encoding: utf-8

class CoursePresenter < BasePresenter
  presents :course

  def name
    smart_render(course.name)
  end

  def description
    smart_render(course.description)
  end

  def admin_links
    content_tag :p do
      edit_button("Izmjeni", edit_course_path(course)) + " | " + delete_button("Izbriši", course_path(course))
    end
  end
end
