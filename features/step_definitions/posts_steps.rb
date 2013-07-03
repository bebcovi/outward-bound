When(/^I attach a cover photo$/) do
  attach_file "Cover photo", photo_path
end

When(/^I click on the post$/) do
  click_on Post.first.title_en
end

Then(/^I should see the post$/) do
  expect(page).to have_content(Post.first.title_en)
end

Then(/^I should be able to attach photos$/) do
  expect(current_path).to eq edit_admin_post_path(Post.first)
end

Then(/^the post should be successfully updated$/) do
  expect(current_path).to eq admin_posts_path
end

Then(/^the post should have 3 photos$/) do
  expect(Post.first).to have(3).photos
end
