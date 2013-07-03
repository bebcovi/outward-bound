When(/^I attach a photo$/) do
  attach_file "Photo", photo_path
end

When(/^I attach (\d+) photos$/) do |n|
  Integer(n).times do
    attach_file "Photo", photo_path
  end
end

When(/^I choose the crop area$/) do
end

Then(/^I should see the carousel photo$/) do
  expect(page).to have_css("img[src='#{CarouselPhoto.first.file_url(:display)}']")
end

Then(/^I should be able to crop the photo$/) do
  expect(current_path).to eq edit_admin_carousel_photo_path(CarouselPhoto.first)
end
