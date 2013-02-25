# encoding: utf-8
require "spec_helper"

feature "Locale" do
  def english!;   within(".lang") { all("a").first.click }; end
  def croatian!;  within(".lang") { all("a").last.click };  end

  before(:each) { visit root_path }

  scenario "changing" do
    expect { croatian! }.to change{I18n.locale}.from(:en).to(:hr)
    expect { english! }.to change{I18n.locale}.from(:hr).to(:en)
  end

  scenario "persistance" do
    english!
    within(".container .main") { click_on "Home" }
    I18n.locale.should eq :en

    croatian!
    within(".container .main") { click_on "Početna" }
    I18n.locale.should eq :hr
  end
end
