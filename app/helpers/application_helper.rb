module ApplicationHelper
  include MarkdownRendering

  Page = Struct.new(:title, :path)
  def navigation_pages
    pages = [
      {controller: "home",         action: "index"},
      {controller: "courses",      action: "index"},
      {controller: "participants", action: "new"},
      {controller: "albums",       action: "index"},
      {controller: "about",        action: "index"},
      {controller: "contact",      action: "index"},
    ]

    pages.map { |page| Page.new(t("#{page[:controller]}.#{page[:action]}.page_title"), page) }
  end

  def icon(name)
    raw content_tag(:i, "", class: "icon-#{name}")
  end

  def main_content(&block)
    content_tag :div, class: "span9" do
      content_tag :div, class: "main_content", &block
    end
  end

  def navigation_sidebar(&block)
    content_tag :div, class: "span3" do
      content_tag :ol, class: "navigation_sidebar nav nav-pills nav-stacked", &block
    end
  end

  def parse_tweet(content)
    content
      .gsub(/@([\w\d_]+)/, link_to('@\1', 'http://twitter.com/\1', class: "mention"))
      .gsub(/#([\w\d]+)/,  link_to('#\1', 'http://twitter.com/search/#\1', class: "hashtag"))
      .html_safe
  end
end
