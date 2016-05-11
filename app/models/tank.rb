class Tank < ActiveRecord::Base



belongs_to :type
belongs_to :country
validates :name, uniqueness: true
validates :name, length: {minimum: 2}
validates :year, numericality: {greater_than_or_equal_to: 1916,
								less_than_or_equal_to: 1960,
								only_integer: true}
								
								
								
								
								



end
