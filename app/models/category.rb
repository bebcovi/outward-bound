require "squeel"

class Category < ActiveRecord::Base
  has_many :courses

  validates :name_en, presence: true
  validates :name_hr, presence: true

  default_scope -> { order{position.asc} }
end
