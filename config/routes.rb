Rails.application.routes.draw do
  devise_for :users
    get '/home', to: "home#show"
    root to: "home#index"
end
