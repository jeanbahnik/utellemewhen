class EventDatesController < ApplicationController
  def new
    @event = Event.find(params[:event])
    @event_date = EventDate.new
  end

  def edit
    @event_date = EventDate.find(params[:id])
    @event = @event_date.event
  end

  def show
  end
  
  def create
    event = Event.find_by_id(params[:event])
    event.event_dates.create(params[:event_date])
    redirect_to event_url(event)
  end
  
  def update
    event_date = EventDate.find_by_id(params[:id])
    event_date.update_attributes(params[:event_date])
    redirect_to event_url(event_date.event)
  end

end
