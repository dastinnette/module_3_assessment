class BestbuyService
  attr_reader :connection, :key

  def initialize
    @connection = Faraday.new(:url => "https://api.bestbuy.com/v1/products") do |faraday|
      faraday.request  :url_encoded
      faraday.response :logger
      faraday.adapter  Faraday.default_adapter
    end
    @key = ENV['best_buy']
  end

  def search
    parse(connection.get("/search=#{searchterm})?format=json&show=sku,name,customerReviewAverage,shortDescription,salePrice,image&pageSize=15&apiKey=#{key}"))
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_name: true)
  end
end
