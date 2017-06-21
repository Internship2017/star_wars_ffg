Rails.application.routes.draw do

  get 'campaigns/new'

  get 'campaigns/create'

	resources :campaigns, only: [:new, :create]
	
  resources :characters

  devise_for :users

end
