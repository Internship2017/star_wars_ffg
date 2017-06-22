Rails.application.routes.draw do

  resources :campaigns, only: [:new, :create, :edit, :update, :index, :show]
  resources :characters
  resources :careers

  devise_for :users

end
