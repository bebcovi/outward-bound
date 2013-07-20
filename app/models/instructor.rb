class Instructor < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader

  validates_presence_of :name_en, :name_hr, :photo,
    :biography_en, :biography_hr

  def to_s
    "#{name_en}/#{name_hr}"
  end
end
