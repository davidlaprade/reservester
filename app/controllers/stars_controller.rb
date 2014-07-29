class StarsController < ApplicationController

	def new
		@star = current_user.stars.new
		redirect_to restaurant_stars_path(params[:restaurant_id])
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

	def destroy
		# raise current_user.inspect
		@star = Star.find_by_id(params[:id])
		@restaurant = Restaurant.find_by_id(params[:restaurant_id])
		@star.destroy
		redirect_to restaurant_path(@restaurant)
	end

	private
	def star_params
		params.require(:stars).permit(:id, :restaurant_id)
	end

end
