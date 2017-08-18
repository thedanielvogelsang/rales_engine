class Api::V1::Merchants::CustomersController < ApplicationController
  def show
    id = Merchant.find(params[:id]).id
    render json: Customer.joins(:invoices)
    .merge(Invoice.where(status: 'pending'))
    .where(invoices: {merchant_id: id})
  end
end
