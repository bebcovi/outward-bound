require "squeel"

class Album < ActiveRecord::Base
  has_many :photos, dependent: :destroy
  belongs_to :cover_photo, class_name: "Photo"

  validates_presence_of :name_hr, :name_en

  before_validation :build_cover_photo, unless: :cover_photo

  accepts_nested_attributes_for :photos, allow_destroy: true
  accepts_nested_attributes_for :cover_photo

  def to_s
    name_en
  end
end
