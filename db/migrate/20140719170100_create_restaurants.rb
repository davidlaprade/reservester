class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
    	t.string :name
    	t.string :description
    	t.string :address
    	t.string :phone
    end
  end
end
