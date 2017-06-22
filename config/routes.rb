Rails.application.routes.draw do

  resources :characters
  resources :careers

  devise_for :users

end
