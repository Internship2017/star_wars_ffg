Rails.application.routes.draw do

  resources :characters

  resources :skills

  devise_for :users

end
