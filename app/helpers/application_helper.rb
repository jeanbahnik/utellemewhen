module ApplicationHelper
  
  def logged_in?
    session[:user_id].present?
  end
  
  def admin?
    logged_in? && current_user.admin?
  end
  
  def current_user
    User.find(session[:user_id])
  end
  
  # def resource_name
  #   :user
  # end
  # 
  # def resource
  #   @resource ||= User.new
  # end
  # 
  # def devise_mapping
  #   @devise_mapping ||= Devise.mappings[:user]
  # end
  
end
