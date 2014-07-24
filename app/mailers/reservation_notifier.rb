class ReservationNotifier < ActionMailer::Base

  default :from => 'dlaprade@friars.providence.edu'

  # send an email to the user when he/she creates a new reservation
  def send_reservation_email(reservation)
    @reservation = reservation
    mail( :to => @reservation.email,
    :subject => 'Thanks for signing up for our amazing app' )
  end

  private
	def mailer_params
	  params.permit(:id)
	end

end
