Given(/^I have created a post$/) do
  FactoryGirl.create(:post)
end

When(/^I click on the post$/) do
  click_on Post.first.title_en
end

When(/^I fill in the (\w+) title and body$/) do |language|
  locale = {"Croatian" => "hr", "English" => "en"}[language.capitalize]
  fill_in "Title #{locale}", with: "Some title"
  fill_in "Body #{locale}",  with: "Some body"
end

Then(/^the post should be successfully created$/) do
  expect(current_path).to eq admin_post_path(Post.first)
end

Then(/^the post should be successfully updated$/) do
  expect(current_path).to eq admin_post_path(Post.first)
end

Then(/^the post should have (\d+) photos$/) do |n|
  expect(Post.first).to have(n).photos
end

Then(/^I should see the post$/) do
  expect(page).to have_content(Post.first.title_en)
end

Then(/^I should( not)? see the (\w+ )?title and body fields$/) do |negative, language|
  assertion = proc do |locale|
    ["Title #{locale}", "Body #{locale}"].each do |field_label|
      expect(page).send (negative ? :not_to : :to), have_field(field_label)
    end
  end

  if language
    locale = {"Croatian" => "hr", "English" => "en"}[language.capitalize]
    assertion.call(locale)
  else
    assertion.call("hr")
    assertion.call("en")
  end
end

Then(/^the post should have (\d+) attachments(?:s)?$/) do |n|
  expect(Post.first).to have(n).attachments
end
