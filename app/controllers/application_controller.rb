class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def logged_in?
    session[:user_id].present?
  end
  
  def current_user
    if logged_in? 
      User.find(session[:user_id])
    else
      nil
    end
  end
  
  def require_admin 
    if session[:user_id]
      if !current_user.admin?
        redirect_to root_url, :notice => "Nice try!"
      end
    else 
      redirect_to root_url, :notice => "Nice try!"
    end
  end
  
end
