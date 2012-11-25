module ApplicationHelper
  include MarkdownRendering

  Page = Struct.new(:title, :path)
  def navigation_pages
    pages = [
      {controller: "home",         action: "index"},
      {controller: "courses",      action: "index"},
      {controller: "participants", action: "new"},
      {controller: "photosets",    action: "index"},
      {controller: "about",        action: "index"},
      {controller: "about",        action: "contact"},
    ]

    pages.map { |page| Page.new(t("#{page[:controller]}.#{page[:action]}.page_title"), page) }
  end
end
