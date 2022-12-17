require 'rails_helper'

RSpec.describe "Editroles", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/editrole/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /created" do
    it "returns http success" do
      get "/editrole/created"
      expect(response).to have_http_status(:success)
    end
  end

end
