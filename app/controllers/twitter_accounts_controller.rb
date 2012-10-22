class TwitterAccountsController < ApplicationController

  # GET /twitter_accounts/new
  # GET /twitter_accounts/new.json
  def new
    @twitter_account = TwitterAccount.create(:user => current_user)
    redirect_to(@twitter_account.authorize_url(twitter_callback_url))
  end

	def callback
	   	if params[:denied] && !params[:denied].empty?
	      redirect_to(account_path(:id=>current_user.id), :alert => 'Unable to connect with twitter: #{parms[:denied]}')
	    else
	      @twitter_account = TwitterAccount.find_by_oauth_token(params[:oauth_token])
	      @twitter_account.validate_oauth_token(params[:oauth_verifier], twitter_callback_url)
	      @twitter_account.save
	      
        # 5.times do |i|
        #   @twitter_account.post("#{i}. life is beautiful!!")
           
        # end
	           	
	      
	      if @twitter_account.active?
	        redirect_to(account_path(:id=>current_user.id), :notice => 'Twitter account activated.')
	      else
	        redirect_to(account_path(:id=>current_user.id), :notice => "Unable to activate twitter account.")
	      end

	    end
	end























  # GET /twitter_accounts
  # GET /twitter_accounts.json
  def index
    @twitter_accounts = TwitterAccount.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @twitter_accounts }
    end
  end

  # GET /twitter_accounts/1
  # GET /twitter_accounts/1.json
  def show
    @twitter_account = TwitterAccount.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @twitter_account }
    end
  end








  # GET /twitter_accounts/1/edit
  def edit
    @twitter_account = TwitterAccount.find(params[:id])
  end

  # POST /twitter_accounts
  # POST /twitter_accounts.json
  def create
    @twitter_account = TwitterAccount.new(params[:twitter_account])

    respond_to do |format|
      if @twitter_account.save
        format.html { redirect_to @twitter_account, notice: 'Twitter account was successfully created.' }
        format.json { render json: @twitter_account, status: :created, location: @twitter_account }
      else
        format.html { render action: "new" }
        format.json { render json: @twitter_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /twitter_accounts/1
  # PUT /twitter_accounts/1.json
  def update
    @twitter_account = TwitterAccount.find(params[:id])

    respond_to do |format|
      if @twitter_account.update_attributes(params[:twitter_account])
        format.html { redirect_to @twitter_account, notice: 'Twitter account was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @twitter_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /twitter_accounts/1
  # DELETE /twitter_accounts/1.json
  def destroy
    @twitter_account = TwitterAccount.find(params[:id])
    @twitter_account.destroy

    respond_to do |format|
      format.html { redirect_to twitter_accounts_url }
      format.json { head :no_content }
    end
  end
end
