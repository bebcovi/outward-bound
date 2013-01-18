require "friendly_id"

class Post < ActiveRecord::Base
  has_one :album, as: :event, dependent: :destroy
  has_many :photos, through: :album
  has_one :cover_photo, through: :album

  translates :title, :body
  extend FriendlyId
  friendly_id :title_en, use: :slugged

  scope :in_language, ->(language) { where(language => true) }

  def to_param
    id.to_s + (slug?? "-#{slug}" : "")
  end
end
