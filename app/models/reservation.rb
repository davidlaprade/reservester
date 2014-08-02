class Reservation < ActiveRecord::Base

validates :email, presence: true
validates :time_and_date, presence: true
validates_uniqueness_of :restaurant_id, scope: [:user_id, :time_and_date], message: "can't be booked twice!"
validates_associated :user, :restaurant

belongs_to :restaurant
belongs_to :user

def self.days
	[Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday]
end

	private
	# generates list of available timeslots
	# call it on a reservation object
	# saves available timeslots to temporary variables stored as arrays
	def time_slots
		a = Array.new
		copy = self.restaurant
		while copy.weekday_open_at < (a.weekday_close_at - 30*60)
			a << copy.weekday_open_at.strftime("%I:%M %p")
			copy.weekday_open_at = copy.weekday_open_at + (60*30)
		end
		# ....
		#  . . .

	end

end
