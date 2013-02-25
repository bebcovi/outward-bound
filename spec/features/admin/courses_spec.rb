require "spec_helper"

feature "Admin courses" do
  before(:each) {
    user = create(:user)
    login_as(user)
  }

  scenario "creating" do
  end
end
