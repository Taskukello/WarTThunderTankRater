require 'rails_helper'

RSpec.describe "ratings/edit", type: :view do
  before(:each) do
    @rating = assign(:rating, Rating.create!(
      :tank => "",
      :user => "",
      :rating => 1
    ))
  end

  it "renders the edit rating form" do
    render

    assert_select "form[action=?][method=?]", rating_path(@rating), "post" do

      assert_select "input#rating_tank[name=?]", "rating[tank]"

      assert_select "input#rating_user[name=?]", "rating[user]"

      assert_select "input#rating_rating[name=?]", "rating[rating]"
    end
  end
end
