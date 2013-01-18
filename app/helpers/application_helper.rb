module ApplicationHelper
  include MarkdownRendering

  Page = Struct.new(:title, :path)
  def navigation_pages
    pages = [
      {controller: "home",    action: "index"},
      {controller: "posts",   action: "index"},
      {controller: "courses", action: "index"},
      {controller: "albums",  action: "index"},
      {controller: "about",   action: "index"},
    ]

    pages.map { |page| Page.new(t("#{page[:controller]}.#{page[:action]}.page_title"), page) }
  end

  def icon(name)
    raw content_tag(:i, "", class: "icon-#{name}")
  end

  def main_content(&block)
    content_tag :div, class: "main_content", &block
  end

  def navigation_sidebar(&block)
    content_tag :ol, class: "navigation_sidebar", &block
  end

  def parse_tweet(content)
    content
      .gsub(/@([\w\d_]+)/, link_to('@\1', 'http://twitter.com/\1', class: "mention"))
      .gsub(/#([\w\d]+)/,  link_to('#\1', 'http://twitter.com/search/#\1', class: "hashtag"))
      .html_safe
  end

  def croatian?
    I18n.locale == :hr
  end

  def english?
    I18n.locale == :en
  end

  def back_button(string, path, options = {})
    link_to string.prepend_icon("chevron-left"), path, options = {}
  end

  def TranslationHash(value)
    TranslationHash.new(value)
  end

  class TranslationHash
    def initialize(hash)
      @hash = hash
    end

    def [](key)
      if @hash.has_key?(key)
        @hash[key]
      else
        @hash[:"#{key}_#{I18n.locale}"]
      end
    end
  end

  def present(object, klass = nil)
    klass ||= "#{object.class}Presenter".constantize
    presenter = klass.new(object, self)
    yield presenter
  end
end
