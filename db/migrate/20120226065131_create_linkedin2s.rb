class CreateLinkedin2s < ActiveRecord::Migration
  def change
    create_table :linkedin2s do |t|
      	t.integer  "user_id"
      	t.boolean  "active",               :default => false
    	t.text     "stream_url"
	    t.string   "oauth_token"
	    t.string   "oauth_token_secret"
	    t.string   "access_token"
	    t.string   "access_token_secret"
        t.timestamps
    end
  end
end
