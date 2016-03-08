class BestbuyService
  attr_reader :connection

  def initialize
    @connection = Faraday.new(:url => "https://api.bestbuy.com/v1/products") do |faraday|
      faraday.request  :url_encoded
      faraday.response :logger
      faraday.adapter  Faraday.default_adapter
    end
  end

  def search
    response = connection.get do |req|        # GET http://sushi.com/search?page=2&limit=100
      req.url '/search', :page => 2
      req.params['limit'] = 15
    end
    response.body
  end


  # private
  #
  # def parse(response)
  #   JSON.parse(response.body, symbolize_name: true)
  # end
end
