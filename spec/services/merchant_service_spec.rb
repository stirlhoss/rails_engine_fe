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

  describe 'find by id endpoint' do
    it 'gets merchant with matching id and parses into json', :vcr do
      response = MerchantService.find_by_id(8)

      expect(response).to be_a Hash
      expect(response[:data]).to be_a Hash
      expect(response[:data][:attributes]).to have_key :name
      expect(response[:data][:attributes][:name]).to eq 'Osinski, Pollich and Koelpin'
    end
  end

  describe 'merchant items endpoint' do
    it 'gets all of a designated merchants items', :vcr do
      response = MerchantService.merchant_items(1)

      expect(response).to be_a Hash
      expect(response[:data]).to be_a Array
      expect(response[:data].count).to eq 15

      first_item = response[:data][0]

      expect(first_item[:attributes]).to have_key :name
      expect(first_item[:attributes]).to have_key :description
      expect(first_item[:attributes]).to have_key :unit_price
      expect(first_item[:attributes]).to have_key :merchant_id
    end
  end
end
