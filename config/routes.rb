Rails.application.routes.draw do
  resources :projects do
    resources :lists, shallow: true 
  end
  resources :cards
  resources :lists do
    resources :cards, shallow: true
  end
  resources :users do 
    resources :projects, shallow: true
  end
  resources :sessions, only: [:index,:create]
  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  post "/login", to: "sessions#create"
  get "/me", to: "sessions#index"
  delete "/logout", to: "sessions#destroy"
  post "/signup", to: "users#create"
  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
end
