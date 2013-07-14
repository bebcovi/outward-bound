require "squeel"

class Album < ActiveRecord::Base
  has_many :photos, dependent: :destroy
  belongs_to :cover_photo, class_name: "Photo"

  validates_presence_of :name_hr, :name_en

  accepts_nested_attributes_for :photos, allow_destroy: true

  def to_s
    name_en
  end
end
