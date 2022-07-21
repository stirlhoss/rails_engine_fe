require 'rails_helper'

RSpec.describe MerchantFacade do
  it 'turns the merchants data in to poros', :vcr do
    expected = MerchantFacade.all_merchants

    expect(expected.class).to eq Array
    expect(expected).to be_all Merchant

    first_merchant = expected[0]
    expect(first_merchant.name).to eq 'Schroeder-Jerde'
    expect(first_merchant.id).to eq 1
  end

  it 'turns merchant data into poro', :vcr do
    merchant = MerchantFacade.find_merchant(8)

    expect(merchant.name).to eq 'Osinski, Pollich and Koelpin'
    expect(merchant.id).to eq 8
  end

  it 'turns the merchants item data in to poros', :vcr do
    merchants = MerchantFacade.all_merchants
    merchant = merchants[0]

    expected = MerchantFacade.merchant_items(merchant.id)

    expect(expected.class).to eq Array
    expect(expected).to be_all Item

    first_item = expected[0]
    expect(first_item.name).to eq 'Item Nemo Facere'
    expect(first_item.id).to eq 4
  end
end
