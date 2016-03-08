require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :controller do

  describe "#index" do
    it "returns all items" do
      visit "/api/v1/items"

      expect()
    end
  end

  describe "show" do
    it "returns a specific item" do
      visit "/api/v1/items/1"

    end
  end

end
