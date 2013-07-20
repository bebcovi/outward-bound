class Instructor < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader

  validates_presence_of :name, :photo,
    :biography_en, :biography_hr

  def to_s
    name
  end
end
