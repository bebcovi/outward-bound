class PostDecorator < Draper::Decorator
  delegate_all
  translates :title, :body
  decorates_association :attachments

  def title
    h.smarty_pants super
  end

  def created_at
    object.created_at.to_date
  end

  def short_body
    h.truncate(body, length: 300, separator: " ")
  end

  def attachments
    object.attachments.available_in(h.current_locale).decorate
  end
end
