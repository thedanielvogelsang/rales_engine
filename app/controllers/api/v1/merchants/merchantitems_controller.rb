class Api::V1::Merchants::MerchantitemsController < ApplicationController

  def index
    render json: Merchant.most_items(search_params[:quantity])
  end

  private

  def search_params
    params.permit(:id, :quantity)
  end

end
