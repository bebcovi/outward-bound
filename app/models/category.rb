require "squeel"

class Category < ActiveRecord::Base
  has_many :courses

  validates_presence_of :name_en, :name_hr

  default_scope -> { order{position.asc} }

  def to_s
    name_en
  end
end
