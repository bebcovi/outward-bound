require "squeel"

class Announcement < ActiveRecord::Base
  belongs_to :post

  scope :available_in, ->(locale) { joins{post}.where{post.send(locale) == true} }
  scope :not_expired,  ->         { where{expires_on >= Date.today} }
  scope :descending,   ->         { order{created_at.desc} }

  validates :content_hr, presence: true, length: {maximum: 255}
  validates :post_id,    presence: true
end
