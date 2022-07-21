require 'rails_helper'

RSpec.describe Merchants: :Index do
  it 'shows the name of all merchants' do
    visit merchants_path

    expect(page).to have_link('Schroeder-Jerde')
  end
end
