Rails.application.routes.draw do

  resources :campaigns, except: [:delete]
  resources :characters do
    resources :character_weapons
  end
  resources :careers do
    post :upload, on: :collection
  end
  resources :specializations
  resources :skills, only: [:show]
  resources :home, only: [:index]
  devise_for :users
  root 'application#index'
end
