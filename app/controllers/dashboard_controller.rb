class DashboardController < ApplicationController
	before_action :authenticate_user!
	before_action :valid_user


	def valid_user
		if current_user&.disabled
		  sign_out(current_user) # Sign out the user if disabled
      flash[:alert] = "Account has been disabled."
      redirect_to new_session_path(:user)
		end
	end

	def index
		@current_time = Time.now.strftime("%Y-%m-%d %H:%M:%S")
		current_hour = Time.now.hour 
		case current_hour
		  when 6..11
		    @text = "Morning"
		  when 12..17
		    @text = "Afternoon"
		  when 18..20
		    @text = "Evening"
		  else
		    @text = "Night"
		  end
	end
end
