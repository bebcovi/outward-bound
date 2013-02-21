require "spec_helper"

describe "Locale" do
  def english!;   within(".lang") { all("a").first.click }; end
  def croatian!;  within(".lang") { all("a").last.click };  end

  before(:each) { visit root_path }

  it "defaults to english" do
    I18n.locale.should eq :en
  end

  it "can be changed" do
    expect { croatian! }.to change{I18n.locale}.from(:en).to(:hr)
    expect { english! }.to change{I18n.locale}.from(:hr).to(:en)
  end

  it "persists between requests" do
    english!
    within(".main, .nav") { first("a").click }
    I18n.locale.should eq :en

    croatian!
    within(".main, .nav") { first("a").click }
    I18n.locale.should eq :hr
  end
end
