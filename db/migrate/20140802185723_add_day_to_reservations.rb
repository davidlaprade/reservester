class AddDayToReservations < ActiveRecord::Migration
  def change
  	 add_column :reservations, :day, :string
  end
end
