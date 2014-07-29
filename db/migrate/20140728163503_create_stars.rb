class CreateStars < ActiveRecord::Migration
  def change
    create_table :stars do |t|
      t.datetime :created_at
      t.integer :user_id
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
