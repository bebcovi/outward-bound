require "squeel"
require "friendly_id"

class Course < ActiveRecord::Base
  belongs_to :category
  belongs_to :album
  belongs_to :application_form, class_name: "Document"

  delegate :cover_photo, to: :album
  # extend FriendlyId
  # friendly_id :name_en, use: [:slugged, :history]
  required_locale_columns :name, :description

  validates_presence_of :category_id
  validates_length_of \
    :dates_en,    :dates_hr,
    :contact_en,  :contact_hr,
    :price_en,    :price_hr,
    :capacity_en, :capacity_hr,
    :duration_en, :duration_hr,
    maximum: 255

  def to_s
    [name_en, name_hr].reject(&:blank?).join("/")
  end
end
