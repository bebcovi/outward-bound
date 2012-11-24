# encoding: utf-8
require "spec_helper_lite"

require "active_record"
require_relative "../../config/initializers/translation"
require_relative "../../app/models/post"

describe Post do
  before(:each) { @it = build(:post) }

  use_nulldb

  it "translates title and body" do
    Post.translated_columns.should include(:title)
    Post.translated_columns.should include(:body)
  end

  describe "validations" do
    it "validates presence of title" do
      @it.title_hr = "Naslov"
      @it.title_en = nil
      @it.should_not be_valid

      @it.title_en = "Title"
      @it.title_hr = nil
      @it.should_not be_valid

      @it.title_en = nil
      @it.title_hr = nil
      @it.should_not be_valid
    end

    it "validates presence of body" do
      @it.body_hr = "Sadržaj"
      @it.body_en = nil
      @it.should_not be_valid

      @it.body_en = "Body"
      @it.body_hr = nil
      @it.should_not be_valid

      @it.body_en = nil
      @it.body_hr = nil
      @it.should_not be_valid
    end
  end
end
