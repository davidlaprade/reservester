class CreateTableForHasAndBelongsToMany < ActiveRecord::Migration
  def change
    create_table :categories_restaurants, :id => false do |t|
    	t.references :category, :restaurant
    end
   	add_index :categories_restaurants, [:category_id, :restaurant_id]
  end
end
