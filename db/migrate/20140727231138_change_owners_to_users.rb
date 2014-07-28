class ChangeOwnersToUsers < ActiveRecord::Migration
  def change
  	rename_column :restaurants, :owner_id, :user_id
  	rename_table :owners, :users
  end
end
