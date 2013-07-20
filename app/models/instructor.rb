require "squeel"
require "acts_as_list"

class Instructor < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  acts_as_list

  default_scope -> { order{position.asc} }

  validates_presence_of :name, :photo,
    :biography_en, :biography_hr

  def to_s
    name
  end
end
