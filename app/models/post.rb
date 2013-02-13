class Post < ActiveRecord::Base
  has_one :album, as: :event, dependent: :destroy
  has_many :photos, through: :album
  has_one :cover_photo, through: :album
  has_many :attachments, dependent: :destroy
  has_one :announcement, dependent: :destroy

  translates :title, :body

  scope :available_in, ->(language) { where("#{table_name}.title_#{language} IS NOT NULL AND #{table_name}.body_#{language} IS NOT NULL") }
  scope :descending,   -> { order("#{table_name}.created_at DESC") }

  def available_in?(language)
    send("title_#{language}?") && send("body_#{language}?")
  end
end
