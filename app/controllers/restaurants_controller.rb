class RestaurantsController < ApplicationController
	before_action :authenticate_owner!, except: [:index, :show]

	def new
		@restaurant = Restaurant.new
		@restaurant.created_by = current_owner.name
	end

	def update
  		@restaurant = Restaurant.find(params[:id])
 
  		if !(current_owner.name == @restaurant.created_by)
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
		@restaurant = Restaurant.find(params[:id])

		if !(current_owner.name == @restaurant.created_by)
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
		@restaurant = current_owner.restaurants.create(restaurant_params)
		# @restaurant = Restaurant.new(restaurant_params)
		# @restaurant.owner_id = current_owner.id

		if @restaurant.save
			redirect_to @restaurant
		else
			render 'new'
		end
	end

	def show
		@restaurant = Restaurant.find(params[:id])
		@reservations = @restaurant.reservations
		
		# only want to store reservations which were created at this restaurant to this variable
		# see "Rails Guides--Active Record Querying" for how this works
		# @reservations = Reservation.where(restaurant_id: @restaurant)

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
			params.require(:restaurant).permit(:name, :description, :address, :phone, :image, :created_by)
		end

end