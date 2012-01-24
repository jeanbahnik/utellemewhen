class SessionsController < ApplicationController

  def new
  end
  
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      cookies.permanent.signed[:user_id] = user.id
      flash[:notice] = "Thanks for signing in!"
      redirect_to user_path(current_user)
    else
      flash[:notice] = "Whoa, try again"
      render :new
    end
  end
  
  def destroy
    reset_session
    cookies[:user_id] = {:expires => 1.day.ago.utc}
    redirect_to :root, :notice => "You are logged out."
  end

end
