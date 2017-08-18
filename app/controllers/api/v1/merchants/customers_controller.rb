class Api::V1::Merchants::CustomersController < ApplicationController

  def show
    id = Merchant.find(params[:id]).id
    render json: Customer.customers_pending(id)
  end

end
