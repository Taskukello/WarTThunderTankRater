class Tank < ActiveRecord::Base



belongs_to :type
belongs_to :country
has_many :weaponsInTanks, dependent: :destroy
has_many :ratings, dependent: :destroy
validates :name, uniqueness: true
validates :type, presence: true
validates :country, presence: true
validates :name, length: {minimum: 2}
validates :year, numericality: {greater_than_or_equal_to: 1916,
								less_than_or_equal_to: 1960,
								only_integer: true}
								
								
								
								
								



end
