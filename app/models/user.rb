class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name
  validates_presence_of :email

  has_many :restaurants, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :reservations_at, through: :reservations, source: :restaurant

  # So users can favorite restaurants
  has_many :favorites, through: :stars, source: :restaurant
  has_many :stars

	def owner?
	  self.role == "owner"
	end
  
	def patron?
		self.role == "patron"
	end

end
