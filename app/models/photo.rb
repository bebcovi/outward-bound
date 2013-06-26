require "squeel"

class Photo < ActiveRecord::Base
  belongs_to :album

  mount_uploader :file, PhotoUploader

  default_scope -> { order{created_at.asc} }
end
