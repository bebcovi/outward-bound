require "squeel"

class Photo < ActiveRecord::Base
  belongs_to :album

  mount_uploader :file, PhotoUploader

  validates :file, presence: true

  default_scope -> { order{created_at.asc} }

  def title
    File.basename(file.url, ".*").titleize
  end
end
