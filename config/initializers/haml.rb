module Haml::Filters::Markdown
  include Haml::Filters::Base
  lazy_require "redcarpet"

  include MarkdownRendering

  def render(text)
    markdown(text)
  end
end
