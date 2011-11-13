class RacesController < ApplicationController

  before_filter :require_admin, :except => [:index, :show]


  # GET /races
  # GET /races.json
  def index
    
    @races = Race.scoped
    
    if params[:name].present?
      @races = @races.where(["name LIKE ?", "%#{params[:name]}%"])
    end
    
    if params[:city].present?
      @races = @races.where(["city = ?", "#{params[:city]}"])
    end
    
    if params[:size].present?
      @races = @races.where(["size = ?", "#{params[:size]}"])
    end
    
    if params[:race_types].present?
      @races = @races.where(["race_type = ?","#{params[:race_types]}"])
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @races }
    end
  end

  # GET /races/1
  # GET /races/1.json
  def show
    @race = Race.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @race }
    end
  end

  # GET /races/new
  # GET /races/new.json
  def new
    
    @race = Race.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @race }
    end
  end

  # GET /races/1/edit
  def edit
    @race = Race.find(params[:id])
  end

  # POST /races
  # POST /races.json
  def create
    @race = Race.new(params[:race])
      
    
    respond_to do |format|
      if @race.save
        
        #if params.has_key?(:race_on) || params.has_key?(:registration_on)
         
           user_searches = CorrespondingSearches(@race)  
           
           user_searches.each do |user_search|    
                  UserMailer.search_mailer(user_search, @race, 3, true).deliver
          # end
        end
        
        format.html { redirect_to @race, :notice => 'Race was successfully created.' }
        format.json { render :json => @race, :status => :created, :location => @race }
      else
        format.html { render :action => "new" }
        format.json { render :json => @race.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /races/1
  # PUT /races/1.json
  def update
 
 
  require 'Date'  
    @race = Race.find(params[:id])
    
     race_changed_value = true
    #   puts params[:race][:race_on]
    #   race_on = Date.parse(params[:race][:race_on])
    #     #   
      # if @race.race_on != race_on
      #         race_changed_value =  1
      #      end
      #                 
      #      if @race.registration_on != Date.parse(params[:registration_on])
      #         race_changed_value =  2
      #      end
      #    
      #      if @race.race_on != Date.parse(params[:race_on]) && @race.registration_on != Date.parse(params[:registration_on])
      #         race_changed_value =  3
      #      end
      #        
     
    respond_to do |format|
      if @race.update_attributes(params[:race])
        
         if race_changed_value

                # @race.users.each do |user|
                #                 # puts "user race mailer"
                #              UserMailer.race_mailer(user, @race, race_changed_value, false).deliver
                # end

           user_searches = CorrespondingSearches(@race)  
           
           user_searches.each do |user_search|    
                  UserMailer.search_mailer(user_search, @race, race_changed_value, false).deliver
           end

          end
           
        format.html { redirect_to @race, :notice => 'Race was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @race.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /races/1
  # DELETE /races/1.json
  def destroy
    @race = Race.find(params[:id])
    @race.destroy

    respond_to do |format|
      format.html { redirect_to races_url }
      format.json { head :ok }
    end
  end
  
  def CorrespondingSearches(race)

    user_searches = UserSearch.scoped

    if race.city.present?
      user_searches = user_searches.where(["city IS NULL OR city = ?", race.city])
    end

    if race.size.present?
      user_searches = user_searches.where(["size IS NULL OR size = ?", race.size])
    end

    # if race.race_type.present?
    #   user_searches = user_searches.where(["type IS NULL OR type = ?",race.race_type])
    # end

    if race.race_on.present?
      user_searches = user_searches.where(["start_on <= ? AND end_on >= ?",race.race_on,race.race_on])
    end
    
    if race.name.present?
    	user_searches = user_searches.where(["name IS NULL OR name LIKE ?" race.name])
    end


    if race.race_type.present?
      user_searches = user_searches.where(["category IS NULL OR category = ?",race.race_type])
    end
    
    
    return user_searches
    
  end


end
