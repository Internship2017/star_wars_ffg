Rails.application.routes.draw do
  devise_for :users
  get '/characters' => 'characters#index'
end
