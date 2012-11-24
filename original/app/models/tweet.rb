class Tweet < ActiveRecord::Base
  attr_accessible :tweet_id, :content, :author

  default_scope order("tweets.created_at DESC")

  validates_uniqueness_of :tweet_id
  validates_presence_of :tweet_id, :content, :author

  before_create :delete_older_tweets

  def self.mentions
    Twitter.mentions(count: 100).map do |mention|
      tweet = new(tweet_id: mention.id.to_s, author: mention.user.screen_name, content: mention.text)
      tweet.instance_eval do
        def in_database?
          @record = self.class.find_by_tweet_id(tweet_id)
          @record.present?
        end

        def record
          @record
        end
      end
      tweet
    end
  end

  private

  def delete_older_tweets
    if self.class.count == 10
      self.class.last.destroy
    end
  end
end
