Rails.application.routes.draw do
  resources :genres
  resources :favorites
  get "signup" => "users#new"
  get "signin" => "sessions#new"
  resource :session
  resources :users
  root 'movies#index'

  resources :movies do 
    resources :reviews
    resources :favorites
  end
end
