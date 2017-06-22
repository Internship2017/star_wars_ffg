Rails.application.routes.draw do

  get 'weapons/index'

  resources :characters

  devise_for :users

end
