Rails.application.routes.draw do

	resources :campaigns, {:new, :create}
	
  resources :characters

  devise_for :users

end
