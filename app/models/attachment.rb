require "uri"

class Attachment < ActiveRecord::Base
  belongs_to :post

  translates :name, :url

  validates :name_hr, presence: {if: :url_hr?}
  validates :name_en, presence: {if: :url_en?}
  validate :validate_presence_of_something

  def extension
    uri = URI.parse(url)
    uri.query = nil
    File.extname(uri.to_s).delete(".")
  end

  private

  def validate_presence_of_something
    if not url_hr? and not url_en?
      errors.add(:base, :blank)
    end
  end
end
