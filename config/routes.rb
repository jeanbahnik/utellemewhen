Tellmewhen::Application.routes.draw do
  
  require File.expand_path("../../lib/logged_in_constraint", __FILE__)  
  
  get "users/join" => "users#join", :as => :join
  
  # devise_for :users
  # devise_for :users do
  #  get 'users', :to => 'users#show', :as => :user_root
  # end

  get "home/index"
  get "home/thank_you"

  post "sessions/create"
  delete "sessions/destroy", :as => :logout
  get "sessions/new", :as => :login

  resources :questions
  resources :races
  resources :users

  resources :race_names
  delete "user_question_delete/:id" => 'UserQuestions#destroy', :as => :user_question_delete

  root :to => "users#show", :constraints => LoggedInConstraint.new(true)
  root :to => "home#index"
  
  get "pages/about", :as => :about
  get "pages/contactus", :as => :contactus
  get "pages/terms", :as => :terms
  get "pages/privacy", :as => :privacy

end
