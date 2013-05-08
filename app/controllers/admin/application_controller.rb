class Admin::ApplicationController < ApplicationController
  before_filter :authenticate
  before_filter :adjust_view_path
  skip_before_filter :use_locale_cookie

  protected

  def set_locale
    I18n.locale = :hr
  end

  def default_url_options(options = {})
    {}
  end

  private

  def authenticate
    if not logged_in?
      redirect_to login_path
    end
  end

  def adjust_view_path
    prepend_view_path "app/views/admin"
  end
end
