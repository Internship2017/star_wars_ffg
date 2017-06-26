Rails.application.routes.draw do

  resources :campaigns, except: [:delete]
  resources :characters
  resources :careers do
    post :upload, on: :collection
  end
  resources :specializations
  resources :skills, only: [:show]

  get 'characters/skills_select' => 'characters#skills_select', as: 'skills_select'

  devise_for :users
end
