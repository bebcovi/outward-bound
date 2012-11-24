class Content < ActiveRecord::Base
  attr_accessible :body_hr, :body_en, :uid, :ordinal
  translates :body

  default_scope order("contents.ordinal ASC")

  validates_presence_of :body_hr, :body_en

  def title
    body.match(/\A<h1>([^<]+)<\/h1>/)[1] rescue nil
  end

  def action
    uid.split("/").last
  end

  def controller
    uid.split("/").first
  end

  def url_hash
    {controller: controller, action: action}
  end

  def self.by_controller(name)
    where("uid LIKE ?", "#{name}%")
  end
end
