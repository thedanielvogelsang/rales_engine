class Api::V1::Customers::InvoicesController < ApplicationController

  def index
    render json: Customer.customer_invoices(params[:id])
  end

end
