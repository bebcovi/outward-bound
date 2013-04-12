class Photo < ActiveRecord::Base
  belongs_to :album

  default_scope -> { order("created_at ASC") }

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
