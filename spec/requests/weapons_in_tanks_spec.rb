require 'rails_helper'

RSpec.describe "WeaponsInTanks", type: :request do
  describe "GET /weapons_in_tanks" do
    it "works! (now write some real specs)" do
      get weapons_in_tanks_path
      expect(response).to have_http_status(200)
    end
  end
end
