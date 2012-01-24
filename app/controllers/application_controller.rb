class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :admin?, :logged_in?, :current_user
  
  def admin?
    logged_in? && current_user.admin?
  end
  
  def logged_in?
    cookies.signed[:user_id].present?
  end
  
  def current_user
    if logged_in?
      User.find(cookies.signed[:user_id])
    else
      nil
    end
  end
  
  def require_admin 
    if logged_in?
      if !current_user.admin?
        redirect_to root_url, :notice => "Nice try!"
      end
    else 
      redirect_to root_url, :notice => "Nice try!"
    end
  end
  
  def require_user 
    if logged_in?
      @user = current_user
    elsif params[:e].present? and params[:m].present?
      @user = User.find_by_email(params[:e])
      if @user && @user.email_token == params[:m]
        sign_in_user(@user)
        flash[:notice] = "Thanks for signing in!"
        puts "email link validated"
      else
        flash[:notice] = "Whoa, try again"
        puts "invalid email:password combination"
        redirect_to login_path #need a better redirect_to, this is for when our system fails.
      end
    else
      redirect_to login_path, :notice => "You must be logged in to do this."
    end
  end
  
  def sign_in_user(user)
    cookies.signed[:user_id] = user.id
  end
  
end