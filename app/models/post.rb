require "squeel"

class Post < ActiveRecord::Base
  belongs_to :cover_photo, class_name: "Photo", dependent: :destroy
  has_one :album, class_name: "PostAlbum", dependent: :destroy
  has_many :photos, through: :album
  has_many :attachments, dependent: :destroy

  required_locale_columns :title, :body

  default_scope  -> { order{created_at.desc} }

  after_initialize :build_cover_photo, unless: :cover_photo
  after_initialize :build_album,       unless: :album

  accepts_nested_attributes_for :cover_photo
  accepts_nested_attributes_for :album
  accepts_nested_attributes_for :attachments, allow_destroy: true

  def to_s
    [title_en, title_hr].find(&:present?)
  end
end
