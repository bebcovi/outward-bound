class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale
  before_filter :load_twitter_mentions, unless: :admin?
  before_filter :use_locale_cookie, unless: :admin?
  before_filter :load_text, unless: :admin?

  def render(*args)
    options = args.extract_options!.dup
    options.update(layout: false) if request.headers["X-fancyBox"]
    args << options
    super(*args)
  end

  protected

  def default_url_options(options = {})
    {locale: params[:locale]}.merge(options)
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def load_twitter_mentions
    @tweets = Tweet.available_in(current_locale)
  end

  def sub_layout
    "application"
  end

  def current_locale
    I18n.locale
  end
  helper_method :current_locale

  def use_locale_cookie
    if cookies[:locale].blank? or params[:locale].present?
      cookies.permanent[:locale] = I18n.locale
    else
      redirect_to locale: cookies[:locale]
    end
  end

  def load_text
    @text = Text.find("#{params[:controller]}/#{params[:action]}")
      .try(:decorate)
  end

  def admin?
    self.class.name =~ /admin/i
  end

  private

  # Go to the application after signing out from the admin interface (Devise)
  def after_sign_out_path_for(*)
    "/"
  end

  # Disable strong_parameters inside the admin interface (Inherited Resources)
  def permitted_params
    params.permit!
  end
end
