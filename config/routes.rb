Rails.application.routes.draw do

  get '/main' => 'main#index'
  root to: redirect('/main')

end
