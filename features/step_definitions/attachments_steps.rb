When(/^I attach (\d+) attachment(?:s)?$/) do |n|
  n.times do
    click_on "Add attachment"
    all("fieldset")[2].all("li").last.attach_file "", file_path
  end
end

When(/^I mark (\d+) attachment(?:s)? for deletion$/) do |n|
  all("fieldset")[2].all("li")[-n..-1].each do |li|
    li.click_on "Remove"
  end
end
