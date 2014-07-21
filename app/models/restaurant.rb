class Restaurant < ActiveRecord::Base
	validates :name, presence: true
	validates :description, presence:true,
							length: {minimum: 5}
	validates :address, presence:true
	validates :phone, presence:true,
					  format: { with: /\d\d\d-\d\d\d-\d\d\d\d/, message: "must be in xxx-xxx-xxxx format"}
					  #makes sure the phone number is in xxx-xxx-xxxx format

	# validates_presence_of :owner
	belongs_to :owner
	has_many :reservations, dependent: :destroy

	mount_uploader :image, ImageUploader

end
