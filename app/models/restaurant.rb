class Restaurant < ActiveRecord::Base
	validates :name, presence: true
	validates_uniqueness_of :name
	validates :description, presence:true,
							length: {minimum: 5}
	validates :address, presence:true
	validates :phone, presence:true,
					  format: { with: /\d\d\d-\d\d\d-\d\d\d\d/, message: "must be in xxx-xxx-xxxx format"}
					  #makes sure the phone number is in xxx-xxx-xxxx format

	belongs_to :user
	has_many :reservations, dependent: :destroy

	# Restaurant categorization
	has_many :categories, through: :categorizations
	has_many :categorizations

	# Allows restaurants to be favorited
	has_many :favorited_by, through: :stars, source: :user
	has_many :stars

	mount_uploader :image, ImageUploader

	def self.category_names
		["Mexican", "Bar", "American", "Fine Dining", "Club", 
			"Fast Food", "Chinese", "Italian", "French", "Bakery"]
	end

	# Want an owner attribute without adding a redundant table
	def owner
		self.user
	end

	# Translate default times into 12-hour format
	def fix_times
		self.weekday_open_at = self.weekday_open_at.strftime("%I:%M %p")
		self.weekday_close_at = self.weekday_close_at.strftime("%I:%M %p")
		self.friday_open_at = self.friday_open_at.strftime("%I:%M %p")
		self.friday_close_at = self.friday_close_at.strftime("%I:%M %p")
		self.saturday_open_at = self.saturday_open_at.strftime("%I:%M %p")
		self.saturday_close_at = self.saturday_close_at.strftime("%I:%M %p")
		self.sunday_open_at = self.sunday_open_at.strftime("%I:%M %p")
		self.sunday_close_at = self.sunday_close_at.strftime("%I:%M %p")
		self.save
	end

end
