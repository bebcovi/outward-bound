require "spec_helper_full"

describe "Locale" do
  def english!;  click_on "English";  end
  def croatian!; click_on "Hrvatski"; end

  before(:each) { visit root_path }

  it "defaults to english" do
    I18n.locale.should eq :en
  end

  it "can be changed" do
    expect { click_on "Hrvatski" }.to change{I18n.locale}.from(:en).to(:hr)
    expect { click_on "English" }.to change{I18n.locale}.from(:hr).to(:en)
  end

  it "persists between requests" do
    english!
    within("#logo") { first("a").click }
    I18n.locale.should eq :en

    croatian!
    within("#logo") { first("a").click }
    I18n.locale.should eq :hr
  end
end
