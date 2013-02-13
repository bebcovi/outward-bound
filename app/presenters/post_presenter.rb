# encoding: utf-8

class PostPresenter < BasePresenter
  presents :post

  def title
    smarty_pants post.title
  end

  def created_at
    post.created_at.to_date
  end

  def short_body
    @t.markdown @t.truncate(post.body, length: 300, separator: " ")
  end

  def body
    @t.markdown post.body
  end

  def has_photos?
    post.photos.count > 1
  end

  def has_attachments?
    post.attachments.any?
  end
end
