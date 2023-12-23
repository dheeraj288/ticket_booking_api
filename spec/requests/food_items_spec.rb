require 'rails_helper'

RSpec.describe "FoodItems", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/food_items/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/food_items/show"
      expect(response).to have_http_status(:success)
    end
  end

end
