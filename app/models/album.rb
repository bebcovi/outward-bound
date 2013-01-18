class Album < ActiveRecord::Base
  has_many :photos, dependent: :destroy
  belongs_to :cover_photo, class_name: "Photo"
  belongs_to :event, polymorphic: true

  def name
    event.name
  end
end
