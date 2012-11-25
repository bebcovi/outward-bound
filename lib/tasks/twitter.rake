namespace :twitter do
  desc "Pull mentions of @outwardb from Twitter"
  task :pull_mentions => :environment do
    Twitter.mentions(count: 10).map do |tweet|
      Tweet.create(tweet_id: tweet.id.to_s, author: tweet.user.screen_name, content: tweet.text)
    end
  end
end
