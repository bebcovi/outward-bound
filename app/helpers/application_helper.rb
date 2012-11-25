require "redcarpet"

module ApplicationHelper
  include MarkdownRendering

  Page = Struct.new(:title, :path)
  def navigation_pages
    pages = [
      {controller: "home",      action: "index"},
      {controller: "about",     action: "index"},
      {controller: "posts",     action: "index"},
    ]

    pages.map { |page| Page.new(t("#{page[:controller]}.#{page[:action]}.page_title"), page) }
  end
end
