Tellmewhen::Application.routes.draw do
  get "users/join" => "users#join", :as => :join
  
  devise_for :users

  get "home/index"
  get "home/thank_you"

  # post "sessions/create"
  # delete "sessions/destroy", :as => :logout
  # get "sessions/new", :as => :login

  resources :questions
  resources :races
  resources :users

  resources :race_names
  delete "user_question_delete/:id" => 'UserQuestions#destroy', :as => :user_question_delete

  root :to => "home#index"
end
