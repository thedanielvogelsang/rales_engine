class Api::V1::Invoices::CustomersController < ApplicationController

  def show
    render json: Invoice.invoice_customers(params[:id])
  end

end
