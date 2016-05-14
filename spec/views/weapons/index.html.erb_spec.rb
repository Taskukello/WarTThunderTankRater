require 'rails_helper'

RSpec.describe "weapons/index", type: :view do
  before(:each) do
    assign(:weapons, [
      Weapon.create!(
        :name => "Name",
        :size => "",
        :year => ""
      ),
      Weapon.create!(
        :name => "Name",
        :size => "",
        :year => ""
      )
    ])
  end

  it "renders a list of weapons" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
