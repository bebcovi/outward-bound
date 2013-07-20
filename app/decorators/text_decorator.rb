class TextDecorator < Draper::Decorator
  delegate_all
  translates :body

  def title
    case controller
    when "home"    then "Home introduction"
    when "courses" then "Courses introduction"
    else                I18n.t("about.#{action}.page_title", locale: :en)
    end
  end
end
