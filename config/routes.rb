Rails.application.routes.draw do

  root :to => 'updates#index'
  resources :user_sessions
  resources :users do 
  	resources :patients, :only => [:new, :index, :create, :show] do
  		resources :updates, :only => [:index, :new, :create]
  	end
  end


  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
end
