require 'rails_helper'

RSpec.describe "weapons_in_tanks/show", type: :view do
  before(:each) do
    @weapons_in_tank = assign(:weapons_in_tank, WeaponsInTank.create!(
      :tank_id => 1,
      :weapon_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
