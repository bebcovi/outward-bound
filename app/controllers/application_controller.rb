class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale
  before_filter :set_mentions

  def render(*args)
    options = args.extract_options!.dup
    options.update(layout: false) if request.headers["X-fancyBox"]
    args << options
    super(*args)
  end

  protected

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

  def current_language
    I18n.locale
  end

  def logged_in?
    cookies[:user_id].present? and User.exists?(cookies[:user_id])
  end
  helper_method :logged_in?
end
