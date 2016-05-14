class Weapon < ActiveRecord::Base

has_many :weaponsInTanks, dependent: :destroy


validates :name, length: {minimum: 2}
validates :size, numericality: {greater_than_or_equal_to: 7,
								less_than_or_equal_to: 156}
validates :year, numericality: {greater_than_or_equal_to: 1916,
								less_than_or_equal_to: 1960,
								only_integer: true}
end
