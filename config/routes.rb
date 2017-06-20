Rails.application.routes.draw do
  get 'characters/:id' => "characters#show", as: :character 

  devise_for :users
end
