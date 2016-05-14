require "rails_helper"

RSpec.describe WeaponsInTanksController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/weapons_in_tanks").to route_to("weapons_in_tanks#index")
    end

    it "routes to #new" do
      expect(:get => "/weapons_in_tanks/new").to route_to("weapons_in_tanks#new")
    end

    it "routes to #show" do
      expect(:get => "/weapons_in_tanks/1").to route_to("weapons_in_tanks#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/weapons_in_tanks/1/edit").to route_to("weapons_in_tanks#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/weapons_in_tanks").to route_to("weapons_in_tanks#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/weapons_in_tanks/1").to route_to("weapons_in_tanks#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/weapons_in_tanks/1").to route_to("weapons_in_tanks#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/weapons_in_tanks/1").to route_to("weapons_in_tanks#destroy", :id => "1")
    end

  end
end
