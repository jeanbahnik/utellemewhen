class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find_by_id(params[:id])
  end
  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.create(params[:event])
    redirect_to new_event_date_url(:event => @event)
  end

  def edit
    @event = Event.find_by_id(params[:id])
  end
  
  def update
    Event.find_by_id(params[:id]).update_attributes(params[:event])
    redirect_to events_url
  end

end
