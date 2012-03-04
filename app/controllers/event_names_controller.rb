class EventNamesController < ApplicationController
  
  def index
    @event_name = Event.order(:name).where("LOWER(name) like ?", "%#{params[:term].downcase}%")
    render json: @event_name.map(&:name)
  end

end