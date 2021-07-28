class ApplicationController < ActionController::Base
    before_action :username


    def username
        # if user is signed in set variables for their username and profile id. 
    
        if user_signed_in?
          # Check if username exists for current user
          if Profile.where(user_id: current_user.id).exists?
    
            # if it exists, set a username variable
            @username = Profile.find_by_user_id(current_user.id).username
        
          # if username does not exist send them to the page to create one
          else
            redirect_to new_profile_path
          end
        end
      end
end
