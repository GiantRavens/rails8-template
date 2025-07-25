Rails.application.routes.draw do
  # Admin routes
  namespace :admin do
    get "/", to: "dashboard#index", as: :root
    resources :users, except: [ :show ]
    resources :posts, except: [ :show ]
  end

  resources :posts, param: :id
  # Define the root path
  root to: "pages#index"
  get "welcome", to: "pages#welcome"
  get "about", to: "pages#about"
  get "dashboard", to: "pages#dashboard"
  get "confirmation", to: "pages#confirmation"
  get "confirmed", to: "pages#confirmed"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Devise routes with custom controllers
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions",
    confirmations: "users/confirmations"
  }
end
