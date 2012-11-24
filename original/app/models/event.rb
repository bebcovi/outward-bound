class Event < ActiveRecord::Base
  attr_accessible :name_hr, :name_en, :start_at, :end_at, :color, :course_id
  translates :name
  has_event_calendar

  belongs_to :course

  default_scope order("start_at ASC")

  validates_presence_of :name_hr, :name_en, :start_at, :end_at
end
