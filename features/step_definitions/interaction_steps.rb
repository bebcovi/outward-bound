When(/^I click on "(.+)"$/) do |text|
  click_on text
end

When(/^I visit (?:the )?(.+)$/) do |page|
  visit path_to(page)
end

When(/^I (un)?check "(.+)"/) do |negative, text|
  negative ? uncheck(text) : check(text)
end

When(/^I fill in "(.+)" with "(.+)"$/) do |field, text|
  fill_in field, with: text
end
