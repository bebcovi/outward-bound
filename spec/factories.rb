# encoding: utf-8

FactoryGirl.define do
  factory :post do
    sequence(:title_en) { |n| "Title #{n}" }
    sequence(:title_hr) { |n| "Naslov #{n}" }
    sequence(:body_en) { |n| "Body #{n}" }
    sequence(:body_hr) { |n| "Sadržaj #{n}" }
  end
end
