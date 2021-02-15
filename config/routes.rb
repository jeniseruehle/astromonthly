Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "static#home"
  resources :users
  resources :horoscopes
  resources :journals

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  
  get '/logout' => 'sessions#destroy'
  post '/logout' => 'sessions#destroy'

  get '/auth/google_oauth2/callback' => 'sessions#GoogleAuth'
  get 'auth/failure', to: redirect('/')
end
