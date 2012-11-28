class Photo < ActiveRecord::Base
  belongs_to :album

  validates_uniqueness_of :uid, scope: :album_id

  def url(size = nil)
    if size
      send("#{size}_size_url")
    else
      read_attribute(:url)
    end
  end
end
