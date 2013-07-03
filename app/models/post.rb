require "squeel"

class Post < ActiveRecord::Base
  belongs_to :cover_photo, class_name: "Photo", dependent: :destroy, validate: true
  belongs_to :album, dependent: :destroy
  has_many :photos, through: :album
  has_many :attachments, dependent: :destroy

  default_scope        ->         { order{created_at.desc} }
  scope :available_in, ->(locale) { where{posts.send(locale) == true} }

  before_create :create_album!

  accepts_nested_attributes_for :cover_photo
  accepts_nested_attributes_for :album
  accepts_nested_attributes_for :attachments, allow_destroy: true

  def available_in?(locale)
    send("#{locale}?")
  end

  def to_s
    "##{position}"
  end

  def position
    self.class.all.index(self) + 1
  end
end
