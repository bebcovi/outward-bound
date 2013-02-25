class Admin::ApplicationController < ApplicationController
  before_filter :authenticate

  private

  def authenticate
    if not logged_in?
      redirect_to login_path
    end
  end
end
