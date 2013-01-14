class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale
  before_filter :set_mentions
  after_filter :cache_page

  def render(*args)
    options = args.extract_options!.dup
    options.update(layout: false) if request.headers["X-fancyBox"]
    args << options
    super(*args)
  end

  private

  def default_url_options(options = {})
    {locale: params[:locale]}
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def set_mentions
    @tweets = Tweet.recent
  end

  def sub_layout
    "application"
  end
end
