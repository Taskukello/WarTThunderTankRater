class WeaponsInTank < ActiveRecord::Base

belongs_to :tank
belongs_to :weapon

end
