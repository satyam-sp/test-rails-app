# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def new
    super
  end

  def create
   self.resource = warden.authenticate!(auth_options)
    if resource.disabled
      sign_out(resource) # Sign out the user if disabled
      flash[:alert] = "Can't log in. Account has been disabled."
      redirect_to new_session_path(resource_name)
    else
      set_flash_message!(:notice, :signed_in)
      sign_in(resource_name, resource)
      redirect_to root_path
    end
  end
end