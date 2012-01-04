class SessionsController < ApplicationController

  def new
  end
  
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Thanks for signing in!"
      redirect_to user_path(session[:user_id])
    else
      flash[:notice] = "Whoa, try again"
      render :new
    end
  end
  
  def destroy
    reset_session
    redirect_to :root, :notice => "You are logged out."
  end

end
