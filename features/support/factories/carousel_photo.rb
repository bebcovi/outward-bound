require "factory_girl"

FactoryGirl.define do
  factory :carousel_photo do
    file { Rack::Test::UploadedFile.new(image_path) }
  end
end
