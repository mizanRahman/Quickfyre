class Subcatagory < ActiveRecord::Base
	belongs_to :catagory
	has_many :posts
end
