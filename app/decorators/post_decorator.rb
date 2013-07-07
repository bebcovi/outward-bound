class PostDecorator < Draper::Decorator
  delegate_all
  translates :title, :body
  decorates_association :attachments

  def title
    h.smarty_pants super
  end

  def created_at
    super.to_date
  end

  def short_body
    h.markdown h.truncate(body, length: 300, separator: " ")
  end

  def body
    h.markdown super
  end

  def has_photos?
    photos.count > 1
  end

  def has_attachments?
    attachments.any?
  end
end
