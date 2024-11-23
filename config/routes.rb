Rails.application.routes.draw do
 devise_for :gamers, controllers: {
 registrations: 'gamers/registrations',
 sessions: 'gamers/sessions',
 passwords: 'gamers/passwords'
}

  
  #devise_for :gamers
  #resources :libraries
  #resources :gamers

  # Adding "only ..." increases the routes. Needed for add/edit/deleting
  resources :gamers, only: [:index, :show, :edit, :update, :destroy] do
    # Nested libraries under gamer.
    # Expanded routes with "only..."
    resource :libraries, only: [:new, :edit, :show, :index, :destory]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "gamers#index"
end
