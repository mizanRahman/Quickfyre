class Linkedin2Controller < ApplicationController
  def new
  	linkedin_account = Linkedin2.create(:user => current_user)
  	redirect_to account_path(:id => current_user.id)    
  end

  def callback
  end
end
