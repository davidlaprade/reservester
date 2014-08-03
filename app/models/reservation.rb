class Reservation < ActiveRecord::Base

# See http://stackoverflow.com/questions/2650897/in-rails-how-should-i-implement-a-status-field-for-a-tasks-app-integer-or-enu#2651261
STATUSES = ['pending', 'approved', 'rejected']
validates_inclusion_of :status, :in => STATUSES,
          :message => "{{value}} must be in #{STATUSES.join ','}"

validates :email, presence: true
validates :time_and_date, presence: true
validates_uniqueness_of :restaurant_id, scope: [:user_id, :day], message: "can't be booked twice the same day!"

validates_associated :user, :restaurant

belongs_to :restaurant
belongs_to :user

	def reserved_by
		User.find_by_id(self.user_id)
	end

	# generates list of available timeslots
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
