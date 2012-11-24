class PostPresenter < BasePresenter
  presents :post

  def title
    smart_render(post.title)
  end

  def created_at
    time_tag post.created_at.to_date
  end

  def body
    smart_render(post.body)
  end

  def admin_links
    content_tag :div, class: "controls" do
      edit_button("", edit_post_path(post)) + delete_button("", post_path(post))
    end
  end
end
