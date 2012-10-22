class LinkedinAccount < ActiveRecord::Base

  API_KEY = 'ehpf2cwwrle0'
  API_SECRET = 'nN6EzLKFNTrOIMaq'
  
  belongs_to :user
  
  
  def authorize_url(callback_url = '')
    client  = LinkedIn::Client.new(API_KEY,API_SECRET)

	  request_token = client.request_token(:oauth_callback => callback_url)
	
  	self.oauth_token = request_token.token
  	self.oauth_token_secret = request_token.secret
  	self.save!
   
    client.request_token.authorize_url
  end
  
  def validate_oauth_token(oauth_verifier)

	  client  = LinkedIn::Client.new(API_KEY,API_SECRET)  	      
    atoken, asecret = client.authorize_from_request(self.oauth_token,self.oauth_token_secret, oauth_verifier)
    
    self.access_token = atoken 						#access_token.params[:oauth_token
    self.access_token_secret = asecret             #access_token.params[:oauth_token_secret]
												    # self.stream_url = "http://twitter.com/#{access_token.params[:screen_name]}"
  	self.active = true    
    self.save!

  end
  
  def post(message)
  	client  = LinkedIn::Client.new(API_KEY,API_SECRET)
    #authoroize from access token
    client.authorize_from_access(self.access_token,self.access_token_secret)
  	client.update_status(message)
  end

  def profile
    client  = LinkedIn::Client.new(API_KEY,API_SECRET)

    client.authorize_from_access(self.access_token,self.access_token_secret)
    client.profile   
  end

  def connections
    client  = LinkedIn::Client.new(API_KEY,API_SECRET)
    
    client.authorize_from_access(self.access_token,self.access_token_secret)
  	client.connections
  end
 
end
