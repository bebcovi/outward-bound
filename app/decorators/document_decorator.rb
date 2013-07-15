class DocumentDecorator < Draper::Decorator
  delegate_all
  translates :file
end
