class UsersController < ApplicationController
  
  before_filter :require_user, :except => [:new, :create]

  def show
    @user = current_user

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @user }
    end
  end

  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @user }
    end
  end

  def edit

  end

  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        UserMailer.new_user_email(@user).deliver
        sign_in_user(@user)
        format.html { redirect_to :root, :notice => 'Thanks for signing up!' }
        format.json { render :json => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @user = current_user

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, :notice => 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
  end

  # def join
  #   @user = User.where(:email => params[:e], :email_token => params[:m]).first
  #   puts @user.inspect
  #   redirect_to new_user_registration_url and return if @user.nil?
  #   sign_in @user
  #   redirect_to edit_user_registration_url(:l => params[:l])
  # end

end
