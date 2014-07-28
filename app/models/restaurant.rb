class Restaurant < ActiveRecord::Base
	validates :name, presence: true
	validates :description, presence:true,
							length: {minimum: 5}
	validates :address, presence:true
	validates :phone, presence:true,
					  format: { with: /\d\d\d-\d\d\d-\d\d\d\d/, message: "must be in xxx-xxx-xxxx format"}
					  #makes sure the phone number is in xxx-xxx-xxxx format


	belongs_to :user
	has_many :reservations, dependent: :destroy

	has_many :categories, through: :categorizations
	has_many :categorizations

	mount_uploader :image, ImageUploader

	def self.category_names
		["Mexican", "Bar", "American", "Fine Dining", "Club", 
			"Fast Food", "Chinese", "Italian", "French", "Bakery"]
	end

	def owner
		self.user
	end

end
