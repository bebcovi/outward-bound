class CourseDecorator < Draper::Decorator
  delegate_all
  translates :name, :description, :dates, :contact,
    :price, :capacity, :duration
  decorates_association :application_form
end
