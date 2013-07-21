require "squeel"

class Attachment < ActiveRecord::Base
  belongs_to :post
  belongs_to :document

  delegate :file_en, :file_hr, to: :document
  required_locale_columns :name

  validates_presence_of :document_id
  validate :validate_document_locale, if: :document_id?

  private

  def validate_document_locale
    if available_in?("en") and document.file_en.blank?
      errors.add(:document, :invalid_en)
    elsif available_in?("hr") and document.file_hr.blank?
      errors.add(:document, :invalid_hr)
    end
  end
end
