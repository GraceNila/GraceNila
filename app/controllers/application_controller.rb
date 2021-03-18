class ApplicationController < ActionController::Base
before_action :set_current_user

 	def set_current_user
		if session[:user_id]
				#flash[:notice] = "userid found"
			Current.user = User.find_by(id: session[:user_id])
		end
	end

	def require_user_logged_in!
		redirect_to sign_in_path, alert: "You must be signed in"  if Current.user.nil?
	end
end
