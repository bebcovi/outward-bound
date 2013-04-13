class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale
  before_filter :set_mentions
  before_filter :use_locale_cookie

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

  def use_locale_cookie
    if cookies[:locale].blank? or params[:locale].present?
      cookies.permanent[:locale] = I18n.locale
    else
      redirect_to locale: cookies[:locale]
    end
  end

  def logged_in?
    cookies[:user_id].present? and User.exists?(cookies[:user_id])
  end
  helper_method :logged_in?
end
