require "squeel"

class Document < ActiveRecord::Base
  mount_uploader :file_en, FileUploader
  mount_uploader :file_hr, FileUploader

  validates_presence_of :name
  validates_uniqueness_of :name
end
