require "friendly_id"

class Course < ActiveRecord::Base
  has_one :album, as: :event

  translates :name, :description, :dates, :contact, :price
  extend FriendlyId
  friendly_id :name_en, use: :slugged

  def to_s
    name
  end

  delegate :cover_photo, to: :album
end
