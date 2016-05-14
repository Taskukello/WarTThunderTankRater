require 'rails_helper'

RSpec.describe "weapons/new", type: :view do
  before(:each) do
    assign(:weapon, Weapon.new(
      :name => "MyString",
      :size => "",
      :year => ""
    ))
  end

  it "renders new weapon form" do
    render

    assert_select "form[action=?][method=?]", weapons_path, "post" do

      assert_select "input#weapon_name[name=?]", "weapon[name]"

      assert_select "input#weapon_size[name=?]", "weapon[size]"

      assert_select "input#weapon_year[name=?]", "weapon[year]"
    end
  end
end
