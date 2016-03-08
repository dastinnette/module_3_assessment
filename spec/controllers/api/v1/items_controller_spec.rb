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
      expect(item2['name']).to        eq items(:item2).name
      expect(item2['description']).to eq items(:item2).description
    end
  end

  xdescribe "#show" do
    it "returns a successful 200 response" do
      get :show, format: :json

      expect(response).to be_success
    end

    it "returns a single student" do
      get :show, format: :json


    end
  end

end
