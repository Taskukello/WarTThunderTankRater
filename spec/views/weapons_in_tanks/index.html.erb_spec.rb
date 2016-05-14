require 'rails_helper'

RSpec.describe "weapons_in_tanks/index", type: :view do
  before(:each) do
    assign(:weapons_in_tanks, [
      WeaponsInTank.create!(
        :tank_id => 1,
        :weapon_id => 2
      ),
      WeaponsInTank.create!(
        :tank_id => 1,
        :weapon_id => 2
      )
    ])
  end

  it "renders a list of weapons_in_tanks" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
