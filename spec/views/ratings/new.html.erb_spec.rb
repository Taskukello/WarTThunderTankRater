require 'rails_helper'

RSpec.describe "ratings/new", type: :view do
  before(:each) do
    assign(:rating, Rating.new(
      :tank => "",
      :user => "",
      :rating => 1
    ))
  end

  it "renders new rating form" do
    render

    assert_select "form[action=?][method=?]", ratings_path, "post" do

      assert_select "input#rating_tank[name=?]", "rating[tank]"

      assert_select "input#rating_user[name=?]", "rating[user]"

      assert_select "input#rating_rating[name=?]", "rating[rating]"
    end
  end
end
