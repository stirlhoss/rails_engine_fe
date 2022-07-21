require 'rails_helper'

RSpec.describe Merchants: :Show do
  it 'shows a merchant and all of their items' do
    visit merchant_path(1)

    expect(page).to have_content('Schroeder-Jerde')
    expect(page).to have_content('Item Nemo Facere')
    expect(page).to have_content('Item Et Cumque')
  end
end
