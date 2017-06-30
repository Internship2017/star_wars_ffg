Rails.application.routes.draw do

  resources :species do
    post :upload, on: :collection
  end
  resources :campaigns, except: [:delete]
  resources :characters do
    resources :character_weapons
    resources :character_gears
  end
  resources :careers do
    post :upload, on: :collection
  end

  resources :specializations
  resources :skills, only: [:show]
  resources :home, only: [:index]
  resources :talents do
    post :upload, on: :collection
  end
  devise_for :users
end