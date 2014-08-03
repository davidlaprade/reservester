class AddStatusToReservations < ActiveRecord::Migration
  def change
  	  add_column :reservations, :status, :string, index: true, default: 'pending'
  	  
  	  # See http://guides.rubyonrails.org/migrations.html to explain why this is here
  	  Reservation.reset_column_information
  	  # Changes all the previously created rows in the database
  	  Reservation.update_all(status: 'pending')
  end
end
