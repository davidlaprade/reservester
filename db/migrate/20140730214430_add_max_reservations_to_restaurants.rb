class AddMaxReservationsToRestaurants < ActiveRecord::Migration
  def change
  	add_column :restaurants, :max_reservations, :integer
  end
end
