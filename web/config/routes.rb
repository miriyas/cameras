Cameras::Application.routes.draw do
  get "users/new"
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  post "login" => "sessions#create"

  resources :cameras do
		collection do
			get :comments
		end
	end
	
	resources :comments
	resources :users
	
  namespace :admin do
    root :to => "cameras#index"

	  get "logout" => "sessions#destroy", :as => "logout"
	  get "login" => "sessions#new", :as => "login"
    post "login" => "sessions#create"

	  resources :sessions
	  resources :cameras do
			resources :comments
			resources :links
		end
	end
	
	root :to => 'cameras#index'
end
