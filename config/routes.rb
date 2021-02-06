Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :horoscopes
  resources :months
  resources :journals

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  
  get '/logout' => 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#create'
end
