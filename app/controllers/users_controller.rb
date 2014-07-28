class UsersController < ApplicationController
	before_action :authenticate_user!
	
	def dashboard
		if user_signed_in?
			@user = current_user
			render 'dashboard'
		else
			redirect_to(new_user_session_path, notice: "You must sign in first!")
		end
	end

end