class AddEmailAndDatetimeToReservationsRemoveOthers < ActiveRecord::Migration
  def change
  	 add_column :reservations, :email, :string
  	 add_column :reservations, :time_and_date, :datetime
  	 add_column :reservations, :message, :string
  	 remove_column :reservations, :time
  	 remove_column :reservations, :date
  	 remove_column :reservations, :name
  	 remove_column :reservations, :at_restaurant
  end
end
