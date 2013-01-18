class Post < ActiveRecord::Base
  has_one :album, as: :event, dependent: :destroy
  has_many :photos, through: :album
  has_one :cover_photo, through: :album

  translates :title, :body
  validates_presence_of :title_hr, :title_en, :body_hr, :body_en
end
