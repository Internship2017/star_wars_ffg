Rails.application.routes.draw do

  resources :campaigns, except: [:delete]
  resources :characters do
  	get :skills_select, on: :collection
    patch :increment_rank, on: :collection
    patch :decrement_rank, on: :collection
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