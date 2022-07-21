class MerchantsController < ApplicationController

  def index
    @merchants = MerchantFacade.all_merchants
  end

  def show
    @merchant = MerchantFacade.find_merchant(params[:id])
    @items = MerchantFacade.merchant_items(@merchant.id)
  end
end
