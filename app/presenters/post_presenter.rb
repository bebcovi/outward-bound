# encoding: utf-8

class PostPresenter < BasePresenter
  presents :post

  def title
    if date_range?
      "#{post.title} (#{date_range})"
    else
      post.title
    end
  end

  def date_range
    from, till = post.from, post.till
    if from.year != till.year
      "#{from.strftime('%-d.%-m.%Y')}–#{till.strftime('%-d.%-m.%Y.')}"
    elsif from.month != till.month
      "#{from.strftime('%-d.%-m')}–#{till.strftime('%-d.%-m.%Y.')}"
    else
      "#{from.strftime('%-d')}–#{till.strftime('%-d.%-m.%Y.')}"
    end
  end

  def date_range?
    post.from? and post.till?
  end

  def created_at
    post.created_at.to_date
  end

  def short_body
    @t.markdown @t.truncate(post.body, length: 200, separator: " ")
  end

  def body
    @t.markdown post.body
  end

  def has_photos?
    post.photos.count > 1
  end
end
