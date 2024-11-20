Rails.application.routes.draw do
  # Devise routes for Gamerprofile
  devise_for :gamerprofiles, controllers: { 
    registrations: 'gamerprofiles/registrations',
    sessions: 'gamerprofiles/sessions',
    passwords: 'gamerprofiles/passwords'
  }

  # Standard RESTful routes for Gamerprofiles
  resources :gamerprofiles, only: [:index, :show]

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Root route
  root "gamerprofiles#index"
end
