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
	has_many :reserved_by, through: :reservations, source: :user 

	# Restaurant categorization
	has_many :categories, through: :categorizations
	has_many :categorizations

	# Allows restaurants to be favorited
	has_many :favorited_by, through: :stars, source: :user
	has_many :stars

	mount_uploader :image, ImageUploader

	attr_accessor :weekday_closed_checkbox

	# before_save :update_fields

	# def update_fields
	# 	if params[:weekday_closed_checkbox] == "checked"
	# 		@restaurant.weekday_open_at = nil
	# 		@restaurant.weekday_close_at = nil
	# 	end
	# end

	def self.category_names
		["Mexican", "Bar", "American", "Fine Dining", "Club", 
			"Fast Food", "Chinese", "Italian", "French", "Bakery"]
	end

	# Want an owner attribute without adding a redundant table
	def owner
		self.user
	end

	# Translate default times into 12-hour format
	# If one value is nil, the restaurant is closed, so the other should be nil as well
	def fix_times
		if !(self.weekday_open_at == nil); self.weekday_open_at = self.weekday_open_at.strftime("%I:%M %p");
			else self.weekday_close_at = self.weekday_open_at; end
		if !(self.weekday_close_at == nil); self.weekday_close_at = self.weekday_close_at.strftime("%I:%M %p"); 
			else self.weekday_open_at = self.weekday_close_at; end
		if !(self.friday_open_at == nil); self.friday_open_at = self.friday_open_at.strftime("%I:%M %p");
			else self.friday_close_at = self.friday_open_at; end
		if !(self.friday_close_at == nil); self.friday_close_at = self.friday_close_at.strftime("%I:%M %p");
			else self.friday_open_at = self.friday_close_at; end
		if !(self.saturday_open_at == nil); self.saturday_open_at = self.saturday_open_at.strftime("%I:%M %p");
			else self.saturday_close_at = self.saturday_open_at; end
		if !(self.saturday_close_at == nil); self.saturday_close_at = self.saturday_close_at.strftime("%I:%M %p");
			else self.saturday_open_at = self.saturday_close_at; end
		if !(self.sunday_open_at == nil); self.sunday_open_at = self.sunday_open_at.strftime("%I:%M %p");
			else self.sunday_close_at = self.sunday_open_at; end
		if !(self.sunday_close_at == nil); self.sunday_close_at = self.sunday_close_at.strftime("%I:%M %p");
			else self.sunday_open_at = self.friday_close_at; end
		self.save
	end

	# def format_time
	# 	self.strftime("%I:%M %p")
	# end

end
