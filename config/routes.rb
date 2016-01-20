Rails.application.routes.draw do
  root to: "home#index"

  get '/home', to: "home#show"
  get '/user', to: "user#show"
  post '/movies/refresh_upcoming', to: "movies#refresh_upcoming"

  devise_for :users, controllers: {
    registrations: "registrations",
    sessions: "sessions"
  }

  resources :movies
  resources :user_movies
end
