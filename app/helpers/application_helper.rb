module ApplicationHelper
  include MarkdownRendering

  Page = Struct.new(:title, :path)
  def navigation_pages
    pages = [
      {controller: "home",      action: "index"},
      {controller: "about",     action: "index"},
      {controller: "posts",     action: "index"},
      {controller: "galleries", action: "index"},
      {controller: "courses",   action: "index"},
      {controller: "business",  action: "index"},
      {controller: "faq",       action: "index"},
    ]

    pages.map { |page| Page.new(t("#{page[:controller]}.#{page[:action]}.page_title"), page) }
  end
end
