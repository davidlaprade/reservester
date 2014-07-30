class Star < ActiveRecord::Base

belongs_to :restaurant
belongs_to :user

# Ensures a person can only favorite a restaurant once
# http://stackoverflow.com/questions/4870961/rails-validate-uniqueness-of-multiple-columns
validates_uniqueness_of :user_id, :scope => :restaurant_id

end
