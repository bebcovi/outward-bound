class SessionsController < ApplicationController
  def new
  end

  def create
    if user = User.authenticate(params[:user])
      login!(user)
      redirect_to root_path
    else
      flash[:alert] = t("flash.incorrect_login")
      render :new
    end
  end

  def destroy
    logout!
    redirect_to :back
  end

  private

  def login!(user)
    session[:user_id] = user.id
  end

  def logout!
    session.delete(:user_id)
  end
end
