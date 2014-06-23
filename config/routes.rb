Rails.application.routes.draw do

  root to: 'main#index'

  get '/auth/:provider/callback' => 'user_sessions#create'
  resource :user_session, only: %w[ new destroy ]

  namespace :api do
    resources :things, only: %w[ index show create ] do
      resource :score, only: %w[ show update ]
      resources :comments, only: %w[ index show create ]
    end
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  get '/(*path)' => 'main#index', as: :main

end
