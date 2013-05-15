# encoding: utf-8

class Admin::AnnouncementsController < Admin::ApplicationController
  def index
    @announcements = Announcement.descending
  end

  def new
    @announcement = Announcement.new
  end

  def create
    @announcement = Announcement.new
    @announcement.assign_attributes(params[:announcement])

    if @announcement.valid?
      @announcement.save
      redirect_to admin_announcements_path, notice: "Objava je uspješno stvorena."
    else
      render :new
    end
  end

  def edit
    @announcement = Announcement.find(params[:id])
  end

  def update
    @announcement = Announcement.find(params[:id])
    @announcement.assign_attributes(params[:announcement])

    if @announcement.valid?
      @announcement.save
      redirect_to admin_announcements_path, notice: "Objava je uspješno izmijenjena."
    else
      render :edit
    end
  end

  def destroy
    Announcement.destroy(params[:id]) if Announcement.exists?(params[:id])
    redirect_to admin_announcements_path, notice: "Objava je uspješno izbrisana."
  end
end
