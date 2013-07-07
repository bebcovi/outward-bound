class AttachmentDecorator < Draper::Decorator
  delegate_all
  translates :file, :name
  delegate :extension, :url, to: :file
end
