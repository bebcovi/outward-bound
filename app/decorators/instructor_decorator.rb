class InstructorDecorator < Draper::Decorator
  delegate_all
  translates :biography
end
