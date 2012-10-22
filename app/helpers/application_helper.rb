module ApplicationHelper
	def userlink
		if user_signed_in?
        	link_to 'Sign out', destroy_user_session_path, :method => :delete
    	else
        	link_to 'Sign in', new_user_session_path,
        end
                  
	end
end