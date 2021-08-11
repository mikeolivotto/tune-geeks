class ApplicationController < ActionController::Base
  before_action :username


  def username
    # if user is signed in but does not have a profile, redirect to create one 
    if (user_signed_in? && !Profile.where(user_id: current_user.id).exists?)
        redirect_to new_profile_path, alert: "You must finish creating a Profile to proceed"
    end
  end

  private

  # Method to check that user is signed in - authorisation method inherite by and applied in other controllers
  def sign_in_required
    if (!user_signed_in?)
      redirect_to root_path, alert: "You must be signed in to perform that action."
    end
  end
end
