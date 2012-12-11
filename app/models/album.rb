class Album < ActiveRecord::Base
  has_many :photos, dependent: :destroy
  belongs_to :cover_photo, class_name: "Photo"
  has_one :course

  delegate :name, to: :course
end
