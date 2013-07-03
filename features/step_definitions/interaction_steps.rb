When(/^I click on "(.+)"$/) do |text|
  click_on text
end

When(/^I visit (?:the )?(.+)$/) do |page|
  visit path_to(page)
end

When(/^I check "(.+)"/) do |text|
  check text
end

When(/^I fill in "(.+)" with "(.+)"$/) do |field, text|
  fill_in field, with: text
end
