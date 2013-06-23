class RemoveTweetIdFromTweets < ActiveRecord::Migration
  def change
    remove_column :tweets, :tweet_id, :string
  end
end
