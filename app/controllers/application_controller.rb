class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource)
  	account_path(resource)
  end
  
  def after_sign_up_path_for(resource)
  	account_path(resource)
  end


end
