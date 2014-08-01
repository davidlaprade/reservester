class Reservation < ActiveRecord::Base

validates :email, presence: true
validates :time_and_date, presence: true

belongs_to :restaurant
belongs_to :user

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

	end

end
