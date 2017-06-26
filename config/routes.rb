Rails.application.routes.draw do

  resources :campaigns, except: [:delete]
  resources :characters
  resources :careers do
    post :upload, on: :collection
  end
  resources :specializations
  resources :skills, only: [:show]
  resources :talents

  devise_for :users
end