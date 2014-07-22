class OwnersController < ApplicationController
	before_action :authenticate_owner!
	
	def show
		@owner = Owner.find(params[:id])
	end

end