class UsersController < ApplicationController
	before_action :authenticate_user!
	
	def dashboard
		if owner_signed_in?
			@owner = current_owner
			render 'dashboard'
		else
			redirect_to(new_owner_session_path, notice: "You must sign in first!")
		end
	end

	private

	def owner?
		@user.role == "owner"
	end

end