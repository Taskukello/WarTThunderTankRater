require 'rails_helper'

RSpec.describe Tank, type: :model do
  
  
  describe "with proper data" do
  

   let(:country){Country.create name:"USSR"}
   let(:type){Type.create name:"Medium tank"}
   
	it "doesn't save without user" do
		tank= Tank.create name:"T-34", type: type, country: country, year: 1939
		expect(tank.valid?).to eq(true)		
	end
   
   let(:user){User.create name:"Taneli", password:"Banaani1", password_confirmation:"Banaani1"}
   
	it "doesn't save tank without type or country" do 
	   tank = Tank.create name:"T-34", type: type, year: 1942
	   tank1 = Tank.create name:"T-34-2", country:country, year: 1943
	   
	   
	   expect(tank.valid?).to eq(false)
	   expect(tank1.valid?).to eq(false)
	end
	
	it "and doesn't save without proper name" do
		tank = Tank.create name:"T", type: type, country: country, year: 1942
		expect(tank.valid?).to eq(false)
	end
	
	it "and doesn't save without proper year" do
		tank1= Tank.create name:"T", type: type, country: country, year: 1915
		tank2 = Tank.create name:"T", type: type, country: country, year: 1961
		expect(tank1.valid?).to eq(false)
		expect(tank2.valid?).to eq(false)
	end
	
	it "and saves proper tank" do
		tank= Tank.create name:"T-34", type: type, country: country, year: 1939
		expect(tank.valid?).to eq(true)
		expect(Tank.count).to eq(1)
	end
  end
  
end
