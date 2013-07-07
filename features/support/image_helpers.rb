module ImageHelpers
  def image_dimensions(image)
    image_matrix = ::Magick::Image.read(image).first
    width, height = image_matrix.columns, image_matrix.rows
    [width, height]
  end
end

World(ImageHelpers)
