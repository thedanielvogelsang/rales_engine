class Api::V1::Invoices::MerchantsController < ApplicationController

  def show
    render json: Invoice.invoice_merchants(params[:id])
  end

end
