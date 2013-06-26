require "squeel"

class Document < ActiveRecord::Base
  mount_uploader :file_en, FileUploader
  mount_uploader :file_hr, FileUploader

  validates :name, presence: true
end
