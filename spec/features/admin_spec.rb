# encoding: utf-8
require "spec_helper"

feature "Admin" do
  before(:each) { @user = create(:user) }

  scenario "login" do
    visit admin_root_path

    current_path.should eq login_path

    click_on "Prijava"
    current_path.should eq login_path

    fill_in "Korisničko ime", with: @user.username
    fill_in "Lozinka",        with: @user.password
    click_on "Prijava"

    current_path.should eq admin_root_path
  end
end
