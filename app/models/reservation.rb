class Reservation < ActiveRecord::Base

validates :email, presence: true
validates :time_and_date, presence: true

belongs_to :restaurant

end
