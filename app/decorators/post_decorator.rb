class PostDecorator < Draper::Decorator
  translates :title, :body

  def title
    h.smarty_pants post.title
  end

  def created_at
    post.created_at.to_date
  end

  def short_body
    h.markdown h.truncate(post.body, length: 300, separator: " ")
  end

  def body
    h.markdown post.body
  end

  def has_photos?
    post.photos.count > 1
  end

  def has_attachments?
    post.attachments.any?
  end
end
