class TweetPresenter < BasePresenter
  presents :tweet

  def author
    "#{link_to("@#{tweet.author}", "http://twitter.com/#{tweet.author}")} #{I18n.t("words.says")}:".html_safe
  end

  def content
    parse_tweet(tweet.content)
  end
end
