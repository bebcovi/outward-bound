task :pull_mentions => :environment do
  TwitterMention.pull_tweets
end
