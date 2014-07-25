class OwnersController < ApplicationController
	before_action :authenticate_owner!
	
	def dashboard
		if owner_signed_in?
			@owner = current_owner
			render 'dashboard'
		else
			redirect_to(new_owner_session_path, notice: "You must sign in first!")
		end
	end

end