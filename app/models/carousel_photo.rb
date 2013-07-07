require "squeel"

class CarouselPhoto < ActiveRecord::Base
  mount_uploader :file, CarouselPhotoUploader

  default_scope     -> { order{created_at.asc} }
  scope :ascending, -> { order{created_at.asc} }

  validates_presence_of :file

  after_update { file.recreate_versions! }

  def to_s
    "##{position}"
  end

  def position
    self.class.all.unscoped.ascending.index(self) + 1
  end
end
