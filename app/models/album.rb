require "squeel"

class Album < ActiveRecord::Base
  has_many :photos, dependent: :destroy
  belongs_to :cover_photo, class_name: "Photo"

  validates_presence_of :name_hr, :name_en

  after_initialize :build_cover_photo, unless: :cover_photo
  before_create :add_cover_photo_to_photos

  accepts_nested_attributes_for :photos, allow_destroy: true
  accepts_nested_attributes_for :cover_photo

  def to_s
    name_en
  end

  private

  def add_cover_photo_to_photos
    photos << cover_photo
  end
end
