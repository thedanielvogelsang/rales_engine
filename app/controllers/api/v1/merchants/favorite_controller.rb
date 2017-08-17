class Api::V1::Merchants::FavoriteController < ApplicationController
  def show
    id = Merchant.find(params[:id])
    render json: Customer.favorite
  end
end
