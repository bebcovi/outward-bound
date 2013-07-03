require "squeel"

class CarouselPhoto < ActiveRecord::Base
  mount_uploader :file, CarouselPhotoUploader

  default_scope -> { order{created_at.asc} }

  validates :file, presence: true

  after_update { file.recreate_versions! }

  def to_s
    "##{position}"
  end

  def position
    self.class.all.index(self) + 1
  end
end
