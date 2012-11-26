require "twitter"

namespace :twitter do
  desc "Pull mentions of @outwardb from Twitter"
  task :pull_mentions => [:environment, :setup] do
    Twitter.mentions(count: 10).map do |tweet|
      Tweet.create(tweet_id: tweet.id.to_s, author: tweet.user.screen_name, content: tweet.text)
    end
  end

  desc "Setup the Twitter client with credentials"
  task :setup do
    Twitter.configure do |config|
      config.consumer_key       = ENV["TWITTER_CONSUMER_KEY"]
      config.consumer_secret    = ENV["TWITTER_CONSUMER_SECRET"]
      config.oauth_token        = ENV["TWITTER_ACCESS_TOKEN"]
      config.oauth_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
    end
  end
end
