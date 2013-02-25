# encoding: utf-8
class SessionsController < ApplicationController
  def new
    @session = Session.new
  end

  def create
    @session = Session.new(params[:session])
    if @session.authenticate
      login(@session.user, @session.remember_me?)
      redirect_to admin_root_path
    else
      flash[:alert] = "Pogrešno korisničko ime ili lozinka."
      render :new
    end
  end

  def destroy
    logout
  end

  private

  def login(user, permanent)
    if permanent
      cookies.permanent[:user_id] = user.id
    else
      cookies[:user_id] = user.id
    end
  end

  def logout
    cookies.delete(:user_id)
  end
end
