class CreateLinkedinAccount < ActiveRecord::Migration
  

  def change
  	create_table :linkedin_accounts do |t|
	    t.integer  "user_id"
	    t.boolean  "active",               :default => false
	    t.text     "stream_url"
	    t.string   "oauth_token"
	    t.string   "oauth_token_secret"
	    t.string   "access_token"
	    t.string   "access_token_secret"
	end
  end

end
