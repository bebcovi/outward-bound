require "factory_girl"

FactoryGirl.define do
  factory :photo do
    file { Rack::Test::UploadedFile.new(image_path) }
  end
end
