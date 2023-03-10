Rails.application.routes.draw do
  resources :cars
  devise_for :users
  root to: "pages#home"
  require 'sidekiq/web'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  authenticate :user, -> (user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
