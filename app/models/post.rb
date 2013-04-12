class Post < ActiveRecord::Base
  has_one :album, as: :event
  has_many :photos, through: :album
  has_one :cover_photo, through: :album
  has_many :attachments, dependent: :destroy
  has_many :announcements, dependent: :destroy

  translates :title, :body

  scope :available_in, ->(locale) {
    where{
      (posts.send("title_#{locale}") != nil) & (posts.send("title_#{locale}") != "") &
      (posts.send("body_#{locale}") != nil) & (posts.send("body_#{locale}") != "")
    }
  }
  scope :descending,   -> { order{created_at.desc} }

  validates :title_hr, presence: true
  validates :body_hr, presence: true

  def available_in?(language)
    send("title_#{language}?") && send("body_#{language}?")
  end

  def to_s
    title
  end
end
