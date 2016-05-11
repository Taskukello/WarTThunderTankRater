require 'rails_helper'

RSpec.describe User, type: :model do
    it "is can not be saved without password" do
		user = User.create name:"Taneli"

		expect(user.valid?).to eq(false)
    end
	
	it "saves when password is valid" do
		user = User.create name:"Taneli", password:"Banaani1", password_confirmation:"Banaani1"
	
		expect(user).to be_valid
		expect(User.count).to eq(1)
	end
	
	
	it "doesn't save when password is invalid" do
		user = User.create name:"Taneli", password:"Baa1", password_confirmation:"Baa1"
		user1 = User.create name:"Totma", password:"banaani1", password_confirmation:"banaani1"
		user2 = User.create name:"Taneli", password:"Banaani", password_confirmation:"Banaani"
		
	    expect(user.valid?).to eq(false)
		expect(user1.valid?).to eq(false)
		expect(user2.valid?).to eq(false)
	end
	
	it "doesn't save too short name" do
		user = User.create name:"Ta", password:"Banaani1", password_confirmation:"Banaani1"
		
		expect(user.valid?).to eq(false)
	end
	
	it "doesn't save too long name" do
		user = User.create name:"kaksitoista12", password:"Banaani1", password_confirmation:"Banaani1"
		
		expect(user.valid?).to eq(false)
	end

end
