Given(/^I have created a carousel photo$/) do
  FactoryGirl.create(:carousel_photo)
end

When(/^I change the crop area$/) do
  all(".jcrop-holder div").first.drag_to(find("#footer"))
  carousel_photo = CarouselPhoto.first
  @old_cropping = %w[crop_x crop_y crop_w crop_h].map do |attribute|
    carousel_photo.send(attribute)
  end
end

Then(/^the carousel photo should be successfully created$/) do
  expect(current_path).to eq edit_admin_carousel_photo_path(CarouselPhoto.first)
end

Then(/^the carousel photo should be cropped$/) do
  carousel_photo = CarouselPhoto.first

  %w[crop_x crop_y crop_w crop_h].each do |attribute|
    expect(carousel_photo.send(attribute)).to be_present
  end

  original_image = uploaded_file(carousel_photo.file_url)
  cropped_image = uploaded_file(carousel_photo.file_url(:display))
  expect(cropped_image).to be_smaller_than(original_image)
end

Then(/^I should be redirected to a page where I can change the cropping of the carosuel photo$/) do
  expect(current_path).to eq edit_admin_carousel_photo_path(CarouselPhoto.first)
end

Then(/^I should see the carousel photo$/) do
  expect(page).to have_css("img[src='#{CarouselPhoto.first.file_url(:display)}']")
end

Then(/^the cropping of the carousel photo should be successfully updated$/) do
  carousel_photo = CarouselPhoto.first
  new_cropping = %w[crop_x crop_y crop_w crop_h].map do |attribute|
    carousel_photo.send(attribute)
  end
  expect(new_cropping).not_to eq @old_cropping
end
