Rails.application.routes.draw do

  resources :characters
  resources :careers
  resources :character_weapons

  devise_for :users

end
