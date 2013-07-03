require "squeel"

class Album < ActiveRecord::Base
  has_many :photos, dependent: :destroy
  belongs_to :cover_photo, class_name: "Photo"

  accepts_nested_attributes_for :photos, allow_destroy: true
end
