Rails.application.routes.draw do
	
  root :to => 'updates#index'
  resources :user_sessions
  resources :users do 
  	resources :patients, :only => [:new, :index, :create]
  end
  resources :updates, :only => [:new, :index, :create]

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
end
