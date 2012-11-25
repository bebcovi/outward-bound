require "redcarpet"

module MarkdownRendering
  def markdown(text)
    smarty_pants(Redcarpet::Markdown.new(Redcarpet::Render::HTML).render(text))
  end

  def smarty_pants(text)
    Redcarpet::Render::SmartyPants.render(text).html_safe
  end
end
