Rails.application.routes.draw do
  devise_for :users

  resources :characters, only: [:edit, :update, :index]
end
