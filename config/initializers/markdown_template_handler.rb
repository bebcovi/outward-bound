include MarkdownRendering

handler = ->(template) { %{markdown(%(#{template.source}))} }
ActionView::Template.register_template_handler(:md, handler)
