class CategoryDecorator < Draper::Decorator
  delegate_all
  decorates_association :courses
  translates :name
end
