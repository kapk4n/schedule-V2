require 'rails_helper'

RSpec.describe "Poseshaemosts", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/poseshaemost/show"
      expect(response).to have_http_status(:success)
    end
  end

end
