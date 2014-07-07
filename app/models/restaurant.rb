class Restaurant < ActiveRecord::Base
	belongs_to :user
	validates_uniqueness_of :name
	validates :name, presence: true
	validates :description, presence:true,
							length: {minimum: 5}
	validates :address, presence:true
	validates :phone, presence:true,
					  format: { with: /\d\d\d-\d\d\d-\d\d\d\d/, message: "must be in xxx-xxx-xxxx format"}
					  #makes sure the phone number is in xxx-xxx-xxxx format

end
