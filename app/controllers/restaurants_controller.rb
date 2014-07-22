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
		@restaurant = Restaurant.new(restaurant_params)
		#names are required to be unique by model validation
		@restaurant.created_by = current_owner.name

		if @restaurant.save
			redirect_to @restaurant
		else
			render 'new'
		end
	end

	def show
		@restaurant = Restaurant.find(params[:id])
		
		# only want to store reservations which were created at this restaurant to this variable
		# see "Rails Guides--Active Record Querying" for how this works
		@restaurant_name = Restaurant.find_by id: @restaurant
		@reservations = Reservation.where(at_restaurant: @restaurant_name.name)

	end

	def destroy
		@restaurant = Restaurant.find(params[:id])
		
		if !(current_owner.name == @restaurant.created_by)
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