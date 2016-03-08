require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :controller do

  describe "#index" do
    it "returns a successful 200 response" do
      get :index, format: :json

      expect(response).to be_success
    end

    it "returns all students" do
      create_items
      get :index, format: :json

      parsed_response = JSON.parse(response.body)
      expect(parsed_response['items'].length).to eq(3)
    end
  end

  describe "#show" do
    it "returns a successful 200 response" do
      get :show, format: :json

      expect(response).to be_success
    end

    it "returns a single student" do
      get :show, format: :json

      
    end
  end

end
