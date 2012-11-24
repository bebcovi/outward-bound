class ContentPresenter < BasePresenter
  presents :content

  def body
    smart_render(content.body)
  end

  def admin_links
    content_tag :p do
      edit_button("Izmjeni", edit_content_path(content))
    end
  end
end
