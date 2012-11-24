# encoding: utf-8

class Course < ActiveRecord::Base
  attr_accessible :category_id, :category, :name_hr, :name_en, :description_hr, :description_en, :ordinal
  translates :name, :description

  default_scope order("courses.ordinal ASC")

  has_many :applications
  has_many :events
  belongs_to :category

  validates_presence_of :category, :name_hr, :name_en, :description_hr, :description_en

  before_create do
    self.ordinal ||= self.class.maximum(:ordinal).to_i + 1
  end

  extend FriendlyId
  friendly_id :name_en, use: :slugged

  def should_generate_new_friendly_id?
    new_record?
  end

  def to_s
    name
  end
end
