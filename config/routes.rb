Planner::Application.routes.draw do
  get 'tasks/index'

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
  
  resources :tasks
end