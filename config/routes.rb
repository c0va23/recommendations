Rails.application.routes.draw do

  get '/main' => 'main#index'
  root to: redirect('/main')

  get '/auth/:provider/callback' => 'user_sessions#create'
  resource :user_session, only: %w[ new destroy ]

  namespace :api do
    resources :things, only: %w[ index ]
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

end
