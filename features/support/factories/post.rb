require "factory_girl"

FactoryGirl.define do
  factory :post do
    en true
    title_en "Some title"
    body_en "Some body"
    association :cover_photo, factory: :photo
    album

    before(:create) do |post|
      FactoryGirl.create_list(:photo, 3, album: post.album)
    end
  end
end
