class Api::V1::Merchants::FavoriteController < ApplicationController

  def show
    render json: Customer.favorite(Merchant.find(params[:id]))
  end

end
