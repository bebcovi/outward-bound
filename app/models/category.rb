require "squeel"
require "acts_as_list"

class Category < ActiveRecord::Base
  has_many :courses

  acts_as_list

  validates_presence_of :name_en, :name_hr

  default_scope -> { order{position.asc} }

  def to_s
    name_en
  end
end
