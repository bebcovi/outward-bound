class Photo < ActiveRecord::Base
  belongs_to :album

  validates_uniqueness_of :uid, scope: :album_id
end
