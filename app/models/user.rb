class User < ActiveRecord::Base
	validates_uniqueness_of :email_address
	has_many :restaurants
		
	end
end
