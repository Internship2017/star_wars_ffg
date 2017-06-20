Rails.application.routes.draw do
  devise_for :users
  get '/characters' => 'characters#index'

  resources :characters, only: [:edit, :update]
end
