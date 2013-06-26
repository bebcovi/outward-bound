require "squeel"

class Post < ActiveRecord::Base
  belongs_to :album
  has_many :attachments, dependent: :destroy

  scope :available_in, ->(locale) { where{posts.send(locale) == true} }
  scope :descending,   ->         { order{created_at.desc} }

  accepts_nested_attributes_for :attachments, allow_destroy: true

  def available_in?(locale)
    send("#{locale}?")
  end
end
