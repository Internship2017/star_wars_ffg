Rails.application.routes.draw do

  resources :campaigns, except: [:delete]
  resources :careers

  devise_for :users

end