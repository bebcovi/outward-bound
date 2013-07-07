RSpec::Matchers.define :be_smaller_than do |original_image|
  match do |cropped_image|
    original_dimensions = image_dimensions(original_image)
    cropped_dimensions = image_dimensions(cropped_image)
    dimensions = original_dimensions.zip(cropped_dimensions)
    dimensions.any? { |original, cropped| original > cropped }
  end
end
