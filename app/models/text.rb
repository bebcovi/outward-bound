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
end
