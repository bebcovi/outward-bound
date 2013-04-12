class Announcement < ActiveRecord::Base
  belongs_to :post

  translates :content

  scope :available_in, ->(locale) { where{(announcements.send("content_#{locale}") != nil) & (announcements.send("content_#{locale}") != "")} }
  scope :not_expired,  ->         { where{expires_on >= Date.today} }
  scope :descending,   ->         { order{created_at.desc} }

  validates :content_hr, presence: true
  validates :post_id, presence: true
end
