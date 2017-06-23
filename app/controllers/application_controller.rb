class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :danger, :info, :warning, :success

  def after_sign_in_path_for(resource)
    characters_path || stored_location_for(resource) || root_path
  end
end