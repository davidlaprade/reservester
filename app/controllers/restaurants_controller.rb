class RestaurantsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]

	def new
		@restaurant = Restaurant.new
		@restaurant.user = current_user
	end

	def update
  		@restaurant = Restaurant.find(params[:id])
  		@restaurant.category_ids = params[:restaurant][:category_ids]
 
  		if !(current_user == @restaurant.user)
			redirect_to restaurants_path, notice: 'Not your restaurant!'
		else 
			if @restaurant.update(restaurant_params)
    		redirect_to @restaurant
 	 		else
    		render 'edit'
    		end
  		end
	end

	def edit
		@restaurant = Restaurant.find_by_id(params[:id])
		# Translate default times into 12-hour format
		@restaurant.weekday_open_at = @restaurant.weekday_open_at.strftime("%I:%M %p")
		@restaurant.weekday_close_at = @restaurant.weekday_open_at.strftime("%I:%M %p")

		if !(current_user == @restaurant.user)
			redirect_to restaurants_path, notice: 'Not your restaurant!'
		else
			render 'edit'
		end
	end

	def index
		# raise current_user.inspect
		@restaurants = Restaurant.all
	end

	def create
		@restaurant = current_user.restaurants.new(restaurant_params)
		@restaurant.category_ids = params[:restaurant][:category_ids]

		if @restaurant.save
			redirect_to @restaurant
		else
			render 'new'
		end
	end

	def show
		@restaurant = Restaurant.find(params[:id])
		@reservations = @restaurant.reservations
	end

	def destroy
		@restaurant = Restaurant.find(params[:id])
		
		if !(current_user.id == @restaurant.user_id)
			puts 'Not your restaurant!'
			redirect_to restaurants_path
		else
			@restaurant.destroy
			redirect_to restaurants_path
		end
	end

	def favorite
		@star = current_user.stars.new
		@star.restaurant_id = params[:id]
		@star.save
		redirect_to restaurant_path(params[:id])
	end

	def unfavorite
		@star = current_user.stars.find_by_restaurant_id(params[:id])
		@star.destroy
		redirect_to restaurant_path(params[:id])
	end

	private
		def restaurant_params
			params.require(:restaurant).permit(:id, :name, :description, :address, :phone, :image, :category_ids)
		end

end