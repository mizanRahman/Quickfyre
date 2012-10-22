class AccountsController < ApplicationController

  # GET /accounts
  # GET /accounts.json
  def index
    @users = User.all
    respond_to do |format|
      format.html # index.html.erb
      # format.json { render json: @twitter_accounts }
    end
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
    @user = User.find_by_id params[:id]
    respond_to do |format|
      format.html # index.html.erb
      # format.json { render json: @twitter_accounts }
    end
  end

  def post
    msg = "#{Time.now}=>life is beautiful !! "
    user = User.find_by_id params[:id]
    begin
      # if user.facebook_account and user.facebook_account.active 
      #   user.facebook_account.post(msg)
      #   #notice ='facebook '    
      # end

      if user.twitter_account and user.twitter_account.active 
        user.twitter_account.post(msg)
        #notice +='twitter '
      end

       if user.linkedin_account and user.linkedin_account.active 
         user.linkedin_account.post(msg)
         #notice += 'linkedin '    
       end
      redirect_to accounts_path , :notice => "post sent success fully to #{notice}"
 
    rescue 
      redirect_to accounts_path , :alert => 'something was wrong. try later.'

    end
  
  end
  
  def create
    
  end

  # PUT /twitter_accounts/1
end
