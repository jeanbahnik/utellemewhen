class QuestionsController < ApplicationController

  def show
    @uSearch = Questions.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @uSearch }
    end
  end

  # GET /races/1/edit
  def edit
    @uSearch = Questions.find(params[:id])
  end

  def generate_temp_password(len)
    chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    newpass = ""
    1.upto(len) { |i| newpass << chars[rand(chars.size-1)] }
    return newpass
  end

  # POST /races
  # POST /races.json
  def create
    # require 'date'
    if not user_signed_in?

      # generate a temporary user password
      new_password = generate_temp_password(8)
      new_email_token = generate_temp_password(8)

      @user = User.new :email => params[:email], :password => new_password, :password_confirmation => new_password, :registered => false, :email_token => new_email_token
      @betold = params[:name]
      @email = @user.email
      
      if @user.save
        UserMailer.auto_generated_user_email(@user, new_email_token, @betold).deliver
      else
        render 'home/index'
        return
      end
    else
      @user = current_user
    end
    
    @uSearch = Question.new
    # @uSearch = @user.questions.build(params[:question])
    @uSearch.users << @user
    @uSearch.name = params[:name]
    #raise @uSearch.users.inspect
    #@user.questions.build_user_question(:uSearch)
    respond_to do |format|
      if @uSearch.save
        if user_signed_in?
          format.html { redirect_to user_path(@user), :notice => 'A query was successfully created.' }
          format.json { render :json => @uSearch, :status => :created, :location => @uSearch }
        else
          format.html { redirect_to home_thank_you_path(:betold => @betold, :email => @email)}
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
    @uSearch = Question.find(params[:id])
    
    respond_to do |format|
      if @uSearch.update_attributes(params[:race])
        format.html { redirect_to @uSearch, :notice => 'Question was successfully updated.' }
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
    @uSearch = Question.find(params[:id])
    @uSearch.destroy
    @user = current_user

    respond_to do |format|
      format.js
      format.html { redirect_to user_path(@user) }
      format.json { head :ok }
    end
  end
end