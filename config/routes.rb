Rails.application.routes.draw do


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
  resources :talents
  resources :home, only: [:index]
  devise_for :users
end
