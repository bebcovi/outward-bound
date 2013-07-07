Given(/^I'm logged in to the admin page$/) do
  user = FactoryGirl.create(:user)
  visit new_user_session_path
  fill_in "Username", with: user.username
  fill_in "Password", with: user.password
  click_on "Login"
end
