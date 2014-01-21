require "acts_as_list"
require "squeel"

class Location < ActiveRecord::Base
  mount_uploader :image, PhotoUploader
  acts_as_list

  default_scope -> { order{position.asc} }

  validates_presence_of :name_en, :name_hr, :description_en, :description_hr

  def to_s
    name_en
  end
end
