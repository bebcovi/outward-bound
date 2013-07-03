When(/^I log in to the admin page$/) do
  user = FactoryGirl.create(:user)
  visit new_user_session_path
  fill_in "Username", with: user.username
  fill_in "Password", with: user.password
  click_on "Login"
end

When(/^I log out from the admin page$/) do
  click_on "Logout"
end
