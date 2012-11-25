class Gallery
  attr_accessor :title

  def initialize(attributes)
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def photos
    5.times.map { "/images/cover_photo.jpg" }
  end

  def to_param
    title
  end
end
