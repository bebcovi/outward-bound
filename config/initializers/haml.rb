module Haml::Filters::Markdown
  include Haml::Filters::Base
  lazy_require "redcarpet"

  def render(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    smarty_pants = Redcarpet::Render::SmartyPants
    smarty_pants.render(markdown.render(text))
  end
end
