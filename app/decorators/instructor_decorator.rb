class InstructorDecorator < Draper::Decorator
  delegate_all
  translates :name, :biography
end
