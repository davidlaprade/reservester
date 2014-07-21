class ReservationsController < ApplicationController

before_filter :assign_restaurant

	def new
		@reservation = Reservation.new

	end

	def create
		@reservation = Reservation.new(reservation_params)
		@reservation.at_restaurant = @restaurant.name

		if @reservation.save
			redirect_to @restaurant
		end
	end


	private
		def reservation_params
			params.require(:reservation).permit(:name, :at_restaurant, :time, :date)
		end

		def assign_restaurant
			@restaurant = Restaurant.find(params[:restaurant_id])
		end


end
