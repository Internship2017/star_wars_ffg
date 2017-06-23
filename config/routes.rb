Rails.application.routes.draw do

  resources :characters
  resources :careers do
  	post :upload, on: :collection
  end

  devise_for :users

end
