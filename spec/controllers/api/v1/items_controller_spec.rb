require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :controller do

  fixtures :items

  describe "#index" do
    it "returns a successful 200 response" do
      get :index, format: :json

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"
    end

    it "returns all students" do
      create_items
      get :index, format: :json

      body  = JSON.parse(response.body)
      item1 = body.first
      item2 = body.last

      expect(item1['name']).to        eq items(:item1).name
      expect(item1['description']).to eq items(:item1).description
    end
  end

  describe "#show" do
    it "returns a successful 200 response and a single customer" do
      get :show, format: :json, id: items(:item1).id

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)

      expect(body['name']).to        eq items(:item1).name
      expect(body['description']).to eq items(:item1).description
    end
  end

end
