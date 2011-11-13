class UserSearchesController < ApplicationController
  
  # GET /races/1
  # GET /races/1.json
  def show
    @uSearch = UserSearch.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @uSearch }
    end
  end

  # GET /races/1/edit
  def edit
    @uSearch = UserSearch.find(params[:id])
  end


  def generate_password(len)
    chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    newpass = ""
    1.upto(len) { |i| newpass << chars[rand(chars.size-1)] }
    return newpass
    
  end

  # POST /races
  # POST /races.json
  def create
    require 'date'
    if not logged_in?
      
      # generate a user password
      new_password = generate_password(8)
      
      @user = User.new :email => params[:email], :password => new_password, :password_confirmation => new_password
      
      if @user.save
        UserMailer.auto_generated_user_email(@user, new_password).deliver
      else
        render 'home/index' 
        return
      end
    else
      @user = current_user
    end
    
    @uSearch = UserSearch.new
    @uSearch.user = @user
    @uSearch.city = params[:city]
    @uSearch.size = params[:size]
    #@uSearch.type = params[:race_types]
    # start_at = Date(params[:race]['start(1i)'].to_i,params[:race]['start(2i)'].to_i,params[:race]['start(3i)'].to_i)
    #     end_at = Date(params[:race]['end(1i)'].to_i,params[:race]['end(2i)'].to_i,params[:race]['end(3i)'].to_i)
    #     @uSearch.start_on = start_at
    #     @uSearch.end_on = end_at
    respond_to do |format|
      if @uSearch.save
        if logged_in?
          format.html { redirect_to user_path(@user), :notice => 'A query was successfully created.' }
          format.json { render :json => @uSearch, :status => :created, :location => @uSearch }
        else
          format.html { redirect_to home_thank_you_path}
        end
      else
        format.html { render :action => "new" }
        format.json { render :json => @uSearch.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /races/1
  # PUT /races/1.json
  def update
    @uSearch = UserSearch.find(params[:id])
    
    respond_to do |format|
      if @uSearch.update_attributes(params[:race])
        format.html { redirect_to @uSearch, :notice => 'UserSearch was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @uSearch.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /races/1
  # DELETE /races/1.json
  def destroy
    @uSearch = UserSearch.find(params[:id])
    @uSearch.destroy

    respond_to do |format|
      format.html { redirect_to races_url }
      format.json { head :ok }
    end
  end
end
