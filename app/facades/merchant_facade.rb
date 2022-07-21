class MerchantFacade
  class << self
    def all_merchants
      parsed_json = MerchantService.all_merchants
      parsed_json[:data].map do |merchant|
        Merchant.new(merchant)
      end
    end

    def find_merchant(id)
      parsed_json = MerchantService.find_by_id(id)
      Merchant.new(parsed_json[:data])
    end

    def merchant_items(id)
      parsed_json = MerchantService.merchant_items(id)
      parsed_json[:data].map do |item|
        Item.new(item)
      end
    end
  end
end
