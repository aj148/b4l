Brackets4life::Application.routes.draw do
	
devise_for :users

  # static pages
  root :to => 'static_pages#index'
  get '/about' => 'static_pages#about'

  # resources
  post '/brackets/new' => 'brackets#new', :as => "new_bracket"
  resources :brackets, :except => [:edit, :update, :new]

  resources :donations, only: [:new, :create]

  resource :payments, only: [:new, :create]

end
