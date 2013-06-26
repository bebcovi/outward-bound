class CategoryDecorator < Draper::Decorator
  decorates_association :courses
  translates :name
end
