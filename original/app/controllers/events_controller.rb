# encoding: utf-8

class EventsController < ApplicationController
  before_filter :authenticate!
  before_filter :store_referer!, only: :index # Overwritten in this controller

  def index
    @events = Event.limit(10)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(params[:event])

    if @event.valid?
      redirect_to events_path, notice: "Event je uspješno stvoren."
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update_attributes(params[:event])
      redirect_to events_path, notice: "Event je uspješno izmjenjen."
    else
      render :edit
    end
  end

  def destroy
    event = Event.destroy(params[:id])
    redirect_to :back, notice: "Event je uspješno izbrisan."
  end

  private

  def store_referer!
    if url_to_hash(request.referer)[:controller] != params[:controller]
      session[:referer] = url_to_hash(request.referer)
    end
  end
end
