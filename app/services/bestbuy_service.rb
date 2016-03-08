class BestbuyService
  attr_reader :connection, :key

  def initialize
    @connection = Faraday.new(url: "https://api.bestbuy.com/v1/products")
    @key        = ENV["best_buy"]
  end

  def search
    parse(connection.get("/search", key))
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_name: true)
  end
end
