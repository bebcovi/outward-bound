require "squeel"
require "acts_as_list"

class Partner < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  acts_as_list

  default_scope     -> { order{position.asc} }
  scope :important, -> { where{important == true} }

  validates_presence_of :photo, :name_en, :name_hr,
    :url_en, :url_hr

  def to_s
    "#{name_en}/#{name_hr}"
  end

  def important!
    toggle!(:important)
  end
end
