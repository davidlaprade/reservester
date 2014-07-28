class RestaurantsController < ApplicationController
	before_action :authenticate_owner!, except: [:index, :show]

	def new
		@restaurant = Restaurant.new
		@restaurant.owner = current_owner
	end

	def update
  		@restaurant = Restaurant.find(params[:id])
  		@restaurant.category_ids = params[:restaurant][:category_ids]
 
  		if !(current_owner == @restaurant.owner)
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

		if !(current_owner == @restaurant.owner)
			redirect_to restaurants_path, notice: 'Not your restaurant!'
		else
			render 'edit'
		end
	end

	def index
		# raise current_owner.inspect
		@restaurants = Restaurant.all
	end

	def create
		@restaurant = current_owner.restaurants.new(restaurant_params)
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
		
		if !(current_owner.id == @restaurant.owner_id)
			puts 'Not your restaurant!'
			redirect_to restaurants_path
		else
			@restaurant.destroy
			redirect_to restaurants_path
		end
	end

	private
		def restaurant_params
			params.require(:restaurant).permit(:id, :name, :description, :address, :phone, :image, :category_ids)
		end

end