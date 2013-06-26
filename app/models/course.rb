require "squeel"
require "friendly_id"

class Course < ActiveRecord::Base
  belongs_to :category
  belongs_to :album
  belongs_to :application_form, class_name: "File"

  delegate :cover_photo, to: :album
  extend FriendlyId
  friendly_id :name_en, use: [:slugged, :history]

  validates :category_id, presence: true
  validates :album_id,    presence: true
end
