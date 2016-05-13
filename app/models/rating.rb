class Rating < ActiveRecord::Base

belongs_to :tank
belongs_to :user

validates :tank_id, presence: true
validates :user_id, presence: true
validates :rating, numericality: {greater_than_or_equal_to: 0,
								  less_than_or_equal_to: 10,
								  only_integer: true}
end
