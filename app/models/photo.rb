class Photo < ActiveRecord::Base
  belongs_to :album

  validates_uniqueness_of :uid, scope: :album_id

  def url(size = nil)
    if size
      send("#{size}_url")
    else
      read_attribute(:url)
    end
  end

  def width(size)
    send("#{size}_width")
  end

  def height(size)
    send("#{size}_height")
  end
end
