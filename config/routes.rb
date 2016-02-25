Brackets4life::Application.routes.draw do

	devise_for :users

  # static pages
  root :to => 'static_pages#index'
  get '/about' => 'static_pages#about'
  get '/tournament' => 'static_pages#tournament'
  get '/prizes' => 'static_pages#prizes'
  get '/charities' => 'static_pages#charities'
  # resources
  resources :brackets # :except => [:edit, :update, :new]
  post '/brackets/new' => 'brackets#new', :as => "new_bracket"

  resources :donations, only: [:new, :create]

  resource :payments, only: [:new, :create]

end
