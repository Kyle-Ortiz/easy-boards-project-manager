Rails.application.routes.draw do
  resources :projects
  resources :cards
  resources :users
  resources :sessions, only: [:index,:create]
  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
end
