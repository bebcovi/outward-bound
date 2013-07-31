require "squeel"

class Course < ActiveRecord::Base
  belongs_to :category
  belongs_to :album
  belongs_to :application_form, class_name: "Document"

  delegate :cover_photo, to: :album
  required_locale_columns :name, :description

  validates_presence_of :category_id
  validates_length_of \
    :dates_en,    :dates_hr,
    :contact_en,  :contact_hr,
    :price_en,    :price_hr,
    :capacity_en, :capacity_hr,
    :duration_en, :duration_hr,
    maximum: 255

  before_create :create_slug

  def self.find(id)
    begin
      super(Integer(id))
    rescue ArgumentError
      find_by!(slug: id)
    end
  end

  def to_s
    [name_en, name_hr].find(&:present?)
  end

  def to_param
    slug
  end

  private

  def create_slug
    self.slug = name_en.parameterize
  end
end
