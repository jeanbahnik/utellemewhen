class SessionsController < ApplicationController

  def new
  end
  
  def create
    render :text => request.env['omniauth.auth'].inspect

    # auth = request.env['omniauth.auth']
    # unless @auth = Authorization.find_from_hash(auth)
      # Create a new user or add an auth to existing user, depending on
      # whether there is already a user signed in.
      # @auth = Authorization.create_from_hash(auth, current_user)
    # end
    # Log the authorizing user in.
    # self.current_user = @auth.user
    # redirect_to :root

    # if current_user
    #   @user = current_user
    #   before_cnt = @user.authentications.count
    #   Authenticator.add_authentication_to_user @user, params[:provider], auth_hash
    #   flash[:notice] = "Successfully authentication"
    # else
    #   @user = Authenticator.find_or_create_user_from_auth_hash params[:provider], auth_hash
    #   cookies.permanent.signed[:remember_token] = @user.id
    #   flash[:notice] = "Signed in"
    # end

    # render :text => "Welcome, #{current_user.name}."
    # user = User.find_by_email(params[:email])
    # if user && user.authenticate(params[:password])
    #   cookies.permanent.signed[:user_id] = user.id
    #   flash[:notice] = "Thanks for signing in!"
    #   redirect_to user_path(current_user)
    # else
    #   flash[:notice] = "Whoa, try again"
    #   render :new
    # end
  end
  
  def destroy
    reset_session
    cookies[:user_id] = {:expires => 1.day.ago.utc}
    redirect_to :root, :notice => "You are logged out."
  end
  
  # def auth_hash
  #     request.env['omniauth.auth']
  # end

end
