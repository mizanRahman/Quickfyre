class FacebookAccountsController < ApplicationController


  def new
    facebook_account = FacebookAccount.create(:user => current_user)    
    redirect_to(
                facebook_account.authorize_url(
                  facebook_callback_url(
                    :id => facebook_account.id
                    )
                )
                )
    #redirect_to(facebook_account.authorize_url(facebook_callback_url))
  end

  def callback
    
    if params[:error_reason] && !params[:error_reason].empty?
      # We have a problem!
      redirect_to(account_path(:id=>current_user.id), :notice => "Unable to activate facebook: #{params[:error_reason]}")
    elsif params[:code] && !params[:code].empty?
      # This is the callback, we have an id and an access code
      facebook_account = FacebookAccount.find(params[:id])
      access_token = facebook_account.get_access_token(
                                        params[:code], 
                                        facebook_callback_url(:id => facebook_account.id)
                                      ) 
      facebook_account.access_token = access_token
      facebook_account.active = true 
      facebook_account.save
      redirect_to(account_path(:id=>current_user.id), :notice =>"Facebook account activated!")
    
    end

  end

end



      # redirect_to(facebook_account.token_url(facebook_callback_url(:id => facebook_account.id),params[:code]))

      # facebook_account.validate_oauth_token(params[:code], facebook_callback_url(:id => facebook_account.id))
       # access_token = facebook_account.get_access_token(params[:code], facebook_callback_url(:id => facebook_account.id))
      