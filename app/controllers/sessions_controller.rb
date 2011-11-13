class SessionsController < ApplicationController

  def new
  end
  
  def create
    user = User.find_by_email(params[:blah])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Thanks for signing in!"
      redirect_to :root
    else
      flash[:notice] = "Whoa, try again"
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to :root, :notice => "You have logged out."
  end


end
