class Text < ActiveRecord::Base
  scope :about, -> { where{controller == "about"} }

  validates_presence_of :body_en, :body_hr

  before_destroy do
    errors.add(:base, :invalid)
    false
  end

  def self.find(uid)
    begin
      super(Integer(uid))
    rescue ArgumentError
      controller, action = uid.split("/")
      where(controller: controller, action: action).first
    end
  end

  def to_s
    case controller
    when "home"    then "Home introduction"
    when "courses" then "Courses introduction"
    else                I18n.t("about.#{action}.page_title", locale: :en)
    end
  end
end
