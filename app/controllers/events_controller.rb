class EventsController < ApplicationController
  before_filter :set_events

  def index
  end

  def show
    @event = @events.find { |event| event.id == params[:id] }
  end

  private

  def set_events
    @events = Event.all
  end

  def sub_layout
    "events"
  end
end
