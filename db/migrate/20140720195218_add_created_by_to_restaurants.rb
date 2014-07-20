class AddCreatedByToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :created_by, :string
  end
end
