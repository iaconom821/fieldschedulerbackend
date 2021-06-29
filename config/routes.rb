Rails.application.routes.draw do
  get "/", to: "fields#home"
  #user login
  namespace :api do
    namespace :v1 do
      
      resources :players
      post "/login", to: "players#login"
      post "/players", to: "players#create"
      get "/auto_login", to: "players#auto_login"
      
      resources :fields
      resources :slots
      resources :games
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
