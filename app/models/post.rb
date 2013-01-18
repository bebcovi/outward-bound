class Post < ActiveRecord::Base
  has_one :album, as: :event, dependent: :destroy
  has_many :photos, through: :album
  has_one :cover_photo, through: :album

  translates :title, :body

  scope :in_language, ->(language) { where(language => true) }
end
