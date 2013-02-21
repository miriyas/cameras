Cameras::Application.routes.draw do
  resources :cameras
	
  namespace :admin do
    root :to => "cameras#index"
	  resources :cameras
	end
	
	root :to => 'cameras#index'
end
