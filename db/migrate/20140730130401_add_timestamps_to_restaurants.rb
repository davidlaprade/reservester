class AddTimestampsToRestaurants < ActiveRecord::Migration
  def change
  	change_table :restaurants do |t|
      t.datetime :weekday_open_at, index: true, default: "2000-01-01 16:00:00"
      t.datetime :weekday_close_at, index: true, default: "2000-01-01 23:59:59"
      t.datetime :friday_open_at, index: true, default: "2000-01-01 16:00:00"
      t.datetime :friday_close_at, index: true, default: "2000-01-01 23:59:59"
      t.datetime :saturday_open_at, index: true, default: "2000-01-01 16:00:00"
      t.datetime :saturday_close_at, index: true, default: "2000-01-01 23:59:59"
      t.datetime :sunday_open_at, index: true, default: "2000-01-01 14:00:00"
      t.datetime :sunday_close_at, index: true, default: "2000-01-01 20:00:00"
  	end
  end
end

