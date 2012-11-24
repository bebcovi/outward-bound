module TweetsHelper
  def parse_tweet(content)
    content
      .gsub(/@([\w\d_]+)/, link_to('@\1', 'http://twitter.com/\1', class: "mention"))
      .gsub(/#([\w\d]+)/,  link_to('#\1', 'http://twitter.com/search/#\1', class: "hashtag"))
      .html_safe
  end
end
