class Dependent < ActiveRecord::Base
	#attr_accessible :customer_id, :last_4, :fname. :lname, :food_stamp, :fs_date, :DOB, :age, :relationship, :created_at, :updated_at

	belongs_to :customer
end