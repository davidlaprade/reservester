class ReservationNotifier < ActionMailer::Base

  default :from => 'admin@reservester.com'

  # send an email to the user when he/she creates a new reservation
  def send_reservation_email(reservation)
    @reservation = reservation
    @user = User.find_by_id(Restaurant.find_by_id(@reservation.restaurant_id).user_id)
    mail( :to => @user.email, :subject => "You have a new reservation at #{Restaurant.find_by_id(@reservation.restaurant_id).name}" )
  end

end
