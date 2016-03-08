class BestbuyService
  attr_reader :connection, :key

  def initialize
    @connection = Faraday.new(url: "https://api.bestbuy.com/v1/products")
    @key = ENV['best_buy']
  end

  def search_broad
    parse(connection.get("/search=#{search_term})?format=json&show=sku,name,customerReviewAverage,shortDescription,salePrice,image&pageSize=15&apiKey=#{key}"))
  end

  private

  def parse(response)
    JSON.parse(response.body)
  end
end
