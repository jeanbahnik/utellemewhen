class RaceNamesController < ApplicationController
  
  def index
    @race_name = Race.order(:name).where("LOWER(name) like ?", "%#{params[:term].downcase}%")
    render json: @race_name.map(&:name)
  end

end