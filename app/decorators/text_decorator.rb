class TextDecorator < Draper::Decorator
  delegate_all
  translates :body
end
