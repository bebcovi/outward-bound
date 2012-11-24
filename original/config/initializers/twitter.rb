Twitter.configure do |config|
  config.consumer_key = ENV["OB_TWITTER_CONSUMER_KEY"]
  config.consumer_secret = ENV["OB_TWITTER_CONSUMER_SECRET"]
  config.oauth_token = ENV["OB_TWITTER_OAUTH_TOKEN"]
  config.oauth_token_secret = ENV["OB_TWITTER_OAUTH_TOKEN_SECRET"]
end
