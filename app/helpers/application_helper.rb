require "redcarpet"

module ApplicationHelper
  def markdown(text)
    smarty_pants(Redcarpet::Markdown.new(Redcarpet::Render::HTML).render(text))
  end

  def smarty_pants(text)
    raw(Redcarpet::Render::SmartyPants.render(text))
  end

  Page = Struct.new(:title, :path)
  def navigation_pages
    pages = [
      {controller: "home", action: "index"},
      {controller: "posts", action: "index"}
    ]

    pages.map { |page| Page.new(t("#{page[:controller]}.#{page[:action]}.page_title"), page) }
  end
end
