class Course < ActiveRecord::Base
  belongs_to :album

  translates :name, :description, :dates, :contact, :price
  extend FriendlyId
  friendly_id :name_en, use: :slugged

  def to_s
    name
  end

  delegate :cover_photo, to: :album
end
