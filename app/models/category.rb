class Category < ActiveRecord::Base
	has_many :restaurants, through: :categorizations
	has_many :categorizations
end
