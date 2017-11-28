Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # resources :auctions

  # resource :session, only: [:new, :create, :destroy]
  # resources :users, only: [:new, :create]

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :auctions, only: [:index, :show, :create, :update, :destroy] do
        resources :bids, shallow: true, only: [:create, :destroy]
      end
      resources :tokens, only: [:create]
    end
  end
  root 'home#index'
end
