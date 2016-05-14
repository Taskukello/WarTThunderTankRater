require 'rails_helper'

RSpec.describe "weapons_in_tanks/edit", type: :view do
  before(:each) do
    @weapons_in_tank = assign(:weapons_in_tank, WeaponsInTank.create!(
      :tank_id => 1,
      :weapon_id => 1
    ))
  end

  it "renders the edit weapons_in_tank form" do
    render

    assert_select "form[action=?][method=?]", weapons_in_tank_path(@weapons_in_tank), "post" do

      assert_select "input#weapons_in_tank_tank_id[name=?]", "weapons_in_tank[tank_id]"

      assert_select "input#weapons_in_tank_weapon_id[name=?]", "weapons_in_tank[weapon_id]"
    end
  end
end
