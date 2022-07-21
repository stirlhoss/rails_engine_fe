class MerchantService
  class << self
    def all_merchants
      call_api('/api/v1/merchants')
    end

    def find_by_id(id)
      call_api("/api/v1/merchants/#{id}")
    end

    def merchant_items(merchant_id)
      call_api("/api/v1/merchants/#{merchant_id}/items")
    end

    private

    def call_api(path)
      response = conn.get(path)
      parsed_data(response)
    end

    def conn
      Faraday.new(url: 'http://localhost:3000') do |faraday|
        faraday.headers['api_key'] = ENV['api_key']
      end
    end

    def parsed_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
