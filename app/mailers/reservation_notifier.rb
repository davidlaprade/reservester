class ReservationNotifier < ActionMailer::Base

  default :from => 'dlaprade@friars.providence.edu'

  # send an email to the user when he/she creates a new reservation
  def send_reservation_email
    @reservation = Reservation.find_by_id(mailer_params[:reservation_id])
    mail( :to => @reservation.email,
    :subject => 'Thanks for signing up for our amazing app' )
  end

  private
	def mailer_params
	  params.permit(:reservation_id)
	end

end
