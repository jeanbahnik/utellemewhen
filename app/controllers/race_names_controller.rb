class RaceNamesController < ApplicationController
  
  def index
    @race_name = Race.order(:name).where("name like ?", "%#{params[:term]}%")
    render json: @race_name.map(&:name)
  end
  
  def show
    @race_name = Race.order(:name).where("name like ?", "%#{params[:term]}%")
    render json: @race_name.map(&:name)
  end
end
