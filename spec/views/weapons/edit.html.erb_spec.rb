require 'rails_helper'

RSpec.describe "weapons/edit", type: :view do
  before(:each) do
    @weapon = assign(:weapon, Weapon.create!(
      :name => "MyString",
      :size => "",
      :year => ""
    ))
  end

  it "renders the edit weapon form" do
    render

    assert_select "form[action=?][method=?]", weapon_path(@weapon), "post" do

      assert_select "input#weapon_name[name=?]", "weapon[name]"

      assert_select "input#weapon_size[name=?]", "weapon[size]"

      assert_select "input#weapon_year[name=?]", "weapon[year]"
    end
  end
end
