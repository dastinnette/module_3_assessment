require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :controller do

  describe "#index" do
    it "returns all items with a successful 200 response" do
      visit "/api/v1/items"
      get :index, format: :json

      expect(response).to be_success
    end
  end

  describe "show" do
    it "returns a specific item with a successful 200 response" do
      visit "/api/v1/items/1"

    end
  end

end
