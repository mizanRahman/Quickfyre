class LinkedinAccountsController < ApplicationController


  def new

	 linkedin_account = LinkedinAccount.new
   #redirect_to account_path(:id => current_user.id)
   redirect_to(linkedin_account.authorize_url(linkedin_callback_url))	
  end



  def callback
  	
  	if params[:denied] && !params[:denied].empty?
      redirect_to(account_path(:id=>current_user.id), :alert => 'Unable to connect with linkedin: #{parms[:denied]}')
     
    else
      @linkedin_account = LinkedinAccount.find_by_oauth_token(params[:oauth_token])
      @linkedin_account.validate_oauth_token(params[:oauth_verifier])
      @linkedin_account.active = true
      @linkedin_account.save#not necessary
      # client.authorize_from_access(session[:atoken], session[:asecret])
      # 5.times do | i|   
      #   @linkedin_account.post("#{Time.now.to_s}. life is beautiful !!")
      # end
  

    end

    
    redirect_to(account_path(:id=>current_user.id), 
    	:notice =>"LinkedIn account activated.")
    

  end


end
