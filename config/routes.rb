Rails.application.routes.draw do
    get '/home', to: "home#show"
    root to: "home#index"
end
