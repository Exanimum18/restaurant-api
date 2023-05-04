Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  devise_for :users
  namespace :api do
    namespace :v1 do
      resources :restaurants do
        resources :reservations
      end
    end
  end
end
