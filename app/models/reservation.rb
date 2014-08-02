class Reservation < ActiveRecord::Base

validates :email, presence: true
validates :time_and_date, presence: true
validates_uniqueness_of :restaurant_id, scope: [:user_id, :time_and_date], message: "can't be booked twice!"
validates_associated :user, :restaurant

belongs_to :restaurant
belongs_to :user


	# generates list of available timeslots
	# call it on a reservation object
	# saves available timeslots to temporary variables stored as arrays
	def self.time_slots
		a = Array.new
		start_time = Time.new(2000, 1, 1, 12)
		close_time = Time.new(2000, 1, 1, 23, 59, 59)

		while start_time < (close_time)
			a << [start_time.strftime("%I:%M %p"), start_time.strftime("%I:%M %p")]
			start_time = start_time + (60*30)
		end
		return a
	end

end
