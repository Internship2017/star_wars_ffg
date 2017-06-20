Rails.application.routes.draw do
  get 'characters/:id' => "characters#show", as: :character 

  devise_for :users

  resources :characters, only: [:edit, :update, :index]
end
