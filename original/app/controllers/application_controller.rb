class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale
  before_filter :setup_calendar
  before_filter :assign_sidebar_tweets

  def default_url_options(options = {})
    {locale: params[:locale]}
  end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def setup_calendar
    month = (params[:month] || Time.zone.now.month).to_i
    year = (params[:year] || Time.zone.now.year).to_i
    @date = Date.civil(year, month)
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end
  helper_method :current_user

  def logged_in?
    session[:user_id].present?
  end
  helper_method :logged_in?

  def not_logged_in?
    !logged_in?
  end
  helper_method :not_logged_in?

  def authenticate!
    if not_logged_in?
      redirect_to root_path
    end
  end

  def assign_sidebar_tweets
    @sidebar_tweets = Tweet.all
  end

  def store_referer!
    if request.referer
      if request.referer.sub(/(en|hr)\//, '') != request.url.sub(/(en|hr)\//, '')
        session[:referer] = url_to_hash(request.referer)
      else
        session[:referer][:locale] = url_to_hash(request.url)[:locale]
      end
    end
  end

  def back
    session[:referer]
  end
  helper_method :back

  private

  def url_to_hash(url)
    Rails.application.routes.recognize_path(url)
  end
end
