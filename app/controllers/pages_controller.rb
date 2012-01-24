class PagesController < ApplicationController

  def about
  end
  
  def index
    if logged_in?
      redirect_to user_url(current_user)
    end
  end

  def contactus
  end
  
  def terms
  end
  
  def privacy
  end

end