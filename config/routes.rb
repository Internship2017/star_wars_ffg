Rails.application.routes.draw do

  resources :campaigns, except: [:delete]
  resources :characters
  resources :careers do
    post :upload, on: :collection
  end
  resources :specializations
  resources :skills [:show]

  devise_for :users
end