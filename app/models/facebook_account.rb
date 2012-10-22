require 'koala'
class FacebookAccount < ActiveRecord::Base


  belongs_to :user
  # Get these from facebook!
  FACEBOOK_CLIENT_ID = '279628612107788'
  FACEBOOK_CLIENT_SECRET = 'a52f9cefea893a0fa38488ebaf2a3861'


  def authorize_url(callback_url = '')
    
    
    client = Koala::Facebook::OAuth.new(
                                    FACEBOOK_CLIENT_ID, 
                                    FACEBOOK_CLIENT_SECRET, 
                                    callback_url)

    if self.oauth_authorize_url.blank?
      self.oauth_authorize_url = client.url_for_oauth_code 
      self.save!
    end
    self.oauth_authorize_url

  end
  
  
  
  def get_access_token(code, callback_url)
    client = Koala::Facebook::OAuth.new(
                                    FACEBOOK_CLIENT_ID, 
                                    FACEBOOK_CLIENT_SECRET, 
                                    callback_url)
    client.get_access_token(code)


  end
  
  
  
  
  
  def post(message)

    @graph = Koala::Facebook::API.new(self.access_token)    
    profile = @graph.get_object("me")
    @graph.put_object("me", "feed", :message => "Life is beautiful !!")
    
  end

end


# module 'facebook'

#   def client
#     @client ||= OAuth2::Client.new(@api_key, @secret, 
#     {
#       :site => 'https://graph.facebook.com',
#       :ssl => {:ca_path => "/etc/ssl/certs"}
#     })
#   end
  
#   def access_token(token)
#     OAuth2::AccessToken.new(client, token)
#   end
  
#   def get_access_token(server_code, redirect_url)
#     access_token = nil
#     begin
#       access_token = client.web_server.get_access_token(server_code, :redirect_uri => redirect_url)
#     rescue Exception => e
#       #TODO Add logs
#     end
#     return access_token
#   end

#   def get_user_permissions(target_user_secret)
#     begin
#       permissions = JSON.parse(access_token(target_user_secret).get('/me/permissions'))
#       return permissions["data"][0].symbolize_keys!
#     rescue Exception => e
#        #TODO Add logs
#       permissions = {}
#     end
#   end

# end
