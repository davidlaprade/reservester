class Restaurant < ActiveRecord::Base
	validates :name, presence: true
	validates :description, presence:true,
							length: {minimum: 5}
	validates :address, presence:true
	validates :phone, presence:true

end
