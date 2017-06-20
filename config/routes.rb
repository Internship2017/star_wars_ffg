Rails.application.routes.draw do


  post '/characters' => 'characters#create'
  get '/characters/new' => 'character#new', as: :new_character

  devise_for :users
end
