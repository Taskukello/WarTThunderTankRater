class Country < ActiveRecord::Base

has_many :tanks, dependent: :destroy


validates :name, uniqueness: true
validates :name, length: {minimum: 2}



end
