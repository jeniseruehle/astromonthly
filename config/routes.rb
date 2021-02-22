Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "static#home"
  match '/auth/:provider/callback' => 'sessions#create_from_facebook', via: [:get, :post]

  resources :users
  resources :horoscopes
  resources :journals do
    get :most_recent, on: :collection
    resources :horoscopes, only: [:new, :index, :create]
  end
  resources :months

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  
  get '/logout' => 'sessions#destroy'
  post '/logout' => 'sessions#destroy'
end
