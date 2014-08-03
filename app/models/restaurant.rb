class Restaurant < ActiveRecord::Base
	validates :name, presence: true
	validates_uniqueness_of :name
	validates :description, presence:true,
							length: {minimum: 5}
	validates :address, presence:true
	validates :phone, presence:true,
					#makes sure the phone number is in xxx-xxx-xxxx format
					  format: { with: /\d\d\d-\d\d\d-\d\d\d\d/, message: "must be in xxx-xxx-xxxx format"}


	belongs_to :user
	has_many :reservations, dependent: :destroy
	has_many :reserved_by, through: :reservations, source: :user 

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

	before_save :update_closed_fields

	def update_closed_fields
		if self.sunday_close_at == nil || self.sunday_open_at == nil
			self.sunday_close_at = nil
			self.sunday_open_at = nil
		end
		if self.weekday_close_at == nil || self.weekday_open_at == nil
			self.weekday_close_at = nil
			self.weekday_open_at = nil
		end
		if self.friday_close_at == nil || self.friday_open_at == nil
			self.friday_close_at = nil
			self.friday_open_at = nil
		end
		if self.saturday_close_at == nil || self.saturday_open_at == nil
			self.saturday_close_at = nil
			self.saturday_open_at = nil
		end
	end

	# Translate default times into 12-hour format
	# If one value is nil, the restaurant is closed, so the other should be nil as well
	def fix_times
		if self.weekday_open_at.present?; self.weekday_open_at = self.weekday_open_at.strftime("%I:%M %p"); end
		if self.weekday_close_at.present?; self.weekday_close_at = self.weekday_close_at.strftime("%I:%M %p"); end 
		if self.friday_open_at.present?; self.friday_open_at = self.friday_open_at.strftime("%I:%M %p"); end
		if self.friday_close_at.present?; self.friday_close_at = self.friday_close_at.strftime("%I:%M %p"); end
		if self.saturday_open_at.present?; self.saturday_open_at = self.saturday_open_at.strftime("%I:%M %p"); end
		if self.saturday_close_at.present?; self.saturday_close_at = self.saturday_close_at.strftime("%I:%M %p"); end
		if self.sunday_open_at.present?; self.sunday_open_at = self.sunday_open_at.strftime("%I:%M %p"); end
		if self.sunday_close_at.present?; self.sunday_close_at = self.sunday_close_at.strftime("%I:%M %p"); end
	end

	# def format_time
	# 	self.strftime("%I:%M %p")
	# end

end
