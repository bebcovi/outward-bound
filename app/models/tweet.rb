class Tweet < ActiveRecord::Base
  validates_uniqueness_of :tweet_id
  validates_presence_of :tweet_id, :content, :author

  default_scope  -> { order{created_at.asc} }
  scope :recent, -> { limit(10) }
end
