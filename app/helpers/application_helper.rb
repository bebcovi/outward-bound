module ApplicationHelper
  include MarkdownRendering

  Page = Struct.new(:title, :path)
  def navigation_pages
    pages = [
      {controller: "home",         action: "index"},
      {controller: "courses",      action: "index"},
      {controller: "participants", action: "new"},
      {controller: "events",       action: "index"},
      {controller: "about",        action: "index"},
      {controller: "about",        action: "contact"},
    ]

    pages.map { |page| Page.new(t("#{page[:controller]}.#{page[:action]}.page_title"), page) }
  end

  def parse_tweet(content)
    content
      .gsub(/@([\w\d_]+)/, link_to('@\1', 'http://twitter.com/\1', class: "mention"))
      .gsub(/#([\w\d]+)/,  link_to('#\1', 'http://twitter.com/search/#\1', class: "hashtag"))
      .html_safe
  end
end
