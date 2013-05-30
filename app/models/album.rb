class Album < ActiveRecord::Base
  has_many :photos, dependent: :destroy
  belongs_to :cover_photo, class_name: "Photo"
  belongs_to :event, polymorphic: true

  def name
    if event_type == "Course"
      course = COURSES.find { |course| course.album_id == id }
      course.name
    else
      event.name
    end
  end
end
