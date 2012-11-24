class Category < ActiveRecord::Base
  attr_accessible :name_en, :name_hr, :object, :ordinal, :uid
  translates :name

  default_scope order("categories.ordinal ASC")
  scope :of_courses, where("categories.object = 'course'")

  has_many :courses

  validates_presence_of :name_en, :name_hr, :object
  validates_uniqueness_of :name_en, :name_hr

  before_create do
    self.ordinal ||= self.class.maximum(:ordinal).to_i + 1
  end

  before_destroy do
    return false if [1, 2, 3].include?(ordinal)
  end

  def to_s
    name
  end
end
