require "squeel"

class Announcement < ActiveRecord::Base
  belongs_to :post

  required_locale_columns :content

  default_scope       -> { order{created_at.desc} }
  scope :not_expired, -> { where{expires_on >= Date.today} }
  scope :ascending,   -> { order{created_at.asc} }

  validates_presence_of :post_id, :expires_on
  validates_length_of :content_en, :content_hr, maximum: 255
  validate :validate_that_post_locale_match, if: :post_id?

  def to_s
    "##{position}"
  end

  def position
    self.class.all.unscoped.ascending.index(self) + 1
  end

  private

  def validate_that_post_locale_match
    if content_en? and not post.available_in?("en")
      errors.add(:content_en, :invalid)
    elsif content_hr? and not post.available_in?("hr")
      errors.add(:content_hr, :invalid)
    end
  end
end
