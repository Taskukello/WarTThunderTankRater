require 'rails_helper'

RSpec.describe "weapons_in_tanks/new", type: :view do
  before(:each) do
    assign(:weapons_in_tank, WeaponsInTank.new(
      :tank_id => 1,
      :weapon_id => 1
    ))
  end

  it "renders new weapons_in_tank form" do
    render

    assert_select "form[action=?][method=?]", weapons_in_tanks_path, "post" do

      assert_select "input#weapons_in_tank_tank_id[name=?]", "weapons_in_tank[tank_id]"

      assert_select "input#weapons_in_tank_weapon_id[name=?]", "weapons_in_tank[weapon_id]"
    end
  end
end
