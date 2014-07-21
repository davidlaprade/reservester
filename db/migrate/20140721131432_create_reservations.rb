class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :name
      t.string :at_restaurant
      t.string :time
      t.string :date

      t.timestamps
    end
  end
end
