class DropCategoryAndRestaurantIdFromTables < ActiveRecord::Migration
  def change
  	remove_column :restaurants, :category_id
  	remove_column :restaurants, :created_by
  end
end
