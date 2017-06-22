Rails.application.routes.draw do

  resources :campaigns, only: [:new, :create, :edit, :update, :index, :show]
  resources :characters

  devise_for :users

end
