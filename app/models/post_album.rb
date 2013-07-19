class PostAlbum < ActiveRecord::Base
  belongs_to :post
  has_many :photos, foreign_key: "album_id", dependent: :destroy

  accepts_nested_attributes_for :photos, allow_destroy: true
end
