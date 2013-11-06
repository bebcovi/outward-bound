require "squeel"
require "acts_as_list"

class Category < ActiveRecord::Base
  has_many :courses

  acts_as_list

  validates_presence_of :name_en, :name_hr

  before_create :create_slug

  def self.find(id)
    begin
      super(Integer(id))
    rescue ArgumentError
      find_by!(slug: id)
    end
  end

  default_scope -> { order{position.asc} }

  def to_s
    name_en
  end

  def create_slug
    self.slug = name_en.parameterize
  end
end
