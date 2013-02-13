class Announcement < ActiveRecord::Base
  belongs_to :post

  translates :content

  scope :available_in, ->(language) { where("#{table_name}.content_#{language} IS NOT NULL") }
  scope :not_expired,  ->           { where("#{table_name}.expires_on >= ?", Date.today) }
end
