Planner::Application.routes.draw do
  resources :time_blocks

  resources :todos do
    post :sort, on: :collection
  end
  

  resources :schedules do 
    get :tomorrow
    get :yesterday
  end
  

  get 'tasks/index'

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
  
  resources :tasks do
    get :set_complete
    get :set_ready
  end
  

end

