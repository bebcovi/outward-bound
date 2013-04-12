class Announcement < ActiveRecord::Base
  belongs_to :post

  translates :content

  scope :available_in, ->(language) { where("#{table_name}.content_#{language} IS NOT NULL") }
  scope :not_expired,  ->           { where("#{table_name}.expires_on >= ?", Date.today) }
  scope :descending,   ->           { order("#{table_name}.created_at DESC") }

  validates :content_hr, presence: true
  validates :post_id, presence: true
end
