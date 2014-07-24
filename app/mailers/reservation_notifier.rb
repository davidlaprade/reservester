class ReservationNotifier < ActionMailer::Base

  default :from => 'admin@reservester.com'

  # send an email to the user when he/she creates a new reservation
  def send_reservation_email(reservation)
    @reservation = reservation
    @owner = Owner.find_by_id(Restaurant.find_by_id(@reservation.restaurant_id).owner_id)
    mail( :to => @owner.email,
    :subject => 'You have a new reservation at #{ Restaurant.find_by_id(@reservation.restaurant_id).name }' )
  end

  private
	def mailer_params
	  params.permit(:id)
	end

end
