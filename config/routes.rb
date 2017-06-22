Rails.application.routes.draw do

  resources :characters
  resources :careers

  resources :skills

  devise_for :users

end
