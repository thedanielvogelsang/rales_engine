class Api::V1::Customers::MerchantsController < ApplicationController

  def show
    render json: Customer.find(params[:id]).favorite_merchant
  end

end
