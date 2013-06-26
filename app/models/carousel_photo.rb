require "squeel"

class CarouselPhoto < ActiveRecord::Base
  mount_uploader :photo, CarouselPhotoUploader

  default_scope -> { order{created_at.asc} }

  validates :photo, presence: true

  after_update { photo.recreate_versions! }

  def to_s
    "##{position}"
  end

  def position
    self.class.all.index(self) + 1
  end
end
