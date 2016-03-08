require 'rails_helper'

RSpec.describe "Bestbuy API", type: :request do
  attr_reader :service

  before do
    @service = BestbuyService.new
  end

  it "returns a list of searched for items" do
    VCR.use_cassette("broad_search") do
      results      = service.search
      first_result = results.first

      expect(first_result["sku"]).to eq(4763330)
      expect(service.search.count).to eq(15)
    end
  end




end
