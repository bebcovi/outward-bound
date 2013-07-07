When(/^I attach a photo$/) do
  attach_file "Photo", image_path
end

When(/^I attach (\d+)(?: new)? photo(?:s)?$/) do |n|
  n.times do
    click_on "Add photo"
    all("fieldset")[1].all("li").last.attach_file "", image_path
  end
end

When(/^I mark (\d+) photo(?:s)? for deletion$/) do |n|
  all("fieldset")[1].all("li")[-n..-1].each do |li|
    li.click_on "Remove"
  end
end

When(/^I attach a cover photo$/) do
  attach_file "Cover photo", image_path
end
