Tellmewhen::Application.routes.draw do
  
  match '/auth/:provider/callback', :to => 'sessions#create'
  
  require File.expand_path("../../lib/logged_in_constraint", __FILE__)  

  # resources :races
  resources :events
  resources :event_dates
  resources :answers
  resources :questions
  resources :users
  resources :event_names

  resources :user_questions
  delete "user_question_delete/:id" => 'UserQuestions#destroy', :as => :user_question_delete
  
  post "sessions/create"
  delete "sessions/destroy", :as => :logout
  get "sessions/new", :as => :login

  get "users/join" => "users#join", :as => :join

  # root :to => "users#show", :constraints => LoggedInConstraint.new(true)
  root :to => "pages#index"

  get "pages/about", :as => :about
  get "pages/contactus", :as => :contactus
  get "pages/terms", :as => :terms
  get "pages/privacy", :as => :privacy
  get "pages/index"
  get "pages/thank_you"
  
  get '/auth/failure' do
    p "oho"
    flash[:notice] = params[:message] # if using sinatra-flash or rack-flash
    # redirect '/'
  end
    
end
