require 'rails_helper'

RSpec.describe MerchantService do
  describe 'all merchants endpoint' do
    it 'gets all merchants and parses into json', :vcr do
      response = MerchantService.all_merchants

      expect(response).to be_a Hash
      expect(response[:data]).to be_a Array
      expect(response[:data].count).to eq 100

      first_merchant = response[:data][0]

      expect(first_merchant[:attributes]).to have_key :name
    end
  end
end
