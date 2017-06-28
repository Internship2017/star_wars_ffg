Rails.application.routes.draw do

  resources :species do
    post :upload, on: :collection
  end

  resources :campaigns, except: [:delete]
  resources :characters
  resources :careers do
    post :upload, on: :collection
  end

  resources :specializations
  resources :skills, only: [:show]
  devise_for :users
end
