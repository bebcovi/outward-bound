class Tweet < ActiveRecord::Base
  validates :content, presence: true
  validates :author, presence: true

  default_scope  -> { order{created_at.asc} }
  scope :recent, -> { limit(10) }
end
