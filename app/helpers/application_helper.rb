require "redcarpet"

module ApplicationHelper
  def markdown(text)
    smarty_pants(Redcarpet::Markdown.new(Redcarpet::Render::HTML).render(text))
  end

  def smarty_pants(text)
    Redcarpet::Render::SmartyPants.render(text.to_s).html_safe
  end

  Page = Struct.new(:title, :path)
  def navigation_pages
    pages = [
      {controller: "home", action: "index"}
    ]
    pages.map do |page|
      Page.new(
        t [page[:controller], page[:action], "page_title"].join("."),
        page
      )
    end
  end
end
