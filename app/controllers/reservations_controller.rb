class ReservationsController < ApplicationController

# so that I don't have to write @restaurant = Restaurant.find(params[:restaurant_id]) each time
# I want this variable each time I'm creating a reservation
before_filter :assign_restaurant

	def new
		@reservation = Reservation.new

	end

	def create
		@reservation = Reservation.new(reservation_params)
		@reservation.restaurant_id = @restaurant.id

		if @reservation.save
			ReservationNotifier.send_reservation_email(@reservation).deliver
			redirect_to(@restaurant, notice: "Reservation created!")
		else
			render 'new'
		end
	end

	def destroy
		@restaurant = current_owner.restaurants.find_by_id(delete_params[:restaurant_id])
		@reservation = @restaurant.reservations.find_by_id(delete_params[:id])
		@reservation.delete
		redirect_to restaurant_path(@restaurant.id)
	end


	private
		def reservation_params
			params.require(:reservation).permit(:email, :time_and_date, :message, :restaurant_id)
		end

		def assign_restaurant
			@restaurant = Restaurant.find(params[:restaurant_id])
		end

		def delete_params
			params.permit(:restaurant_id, :id)
		end

end
