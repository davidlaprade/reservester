class StarsController < ApplicationController

	def new
		@star = current_user.stars.new
		@star.restaurant_id = params[:star][:restaurant_id]
		redirect_to restaurant_stars(@star.restaurant_id)
	end

	def create
		@star = current_user.stars.new
		@star.restaurant_id = params[:restaurant][:restaurant_id]
		
		if @star.save
			redirect_to @restaurant
		else
			render 'new'
		end
	end

	private
	def star_params
		params.require(:star).permit(:restaurant_id)
	end

end
