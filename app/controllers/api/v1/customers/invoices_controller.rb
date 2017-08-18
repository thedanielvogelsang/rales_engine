class Api::V1::Customers::InvoicesController < ApplicationController
  def index
    render json: Customer.find(params[:id]).invoices.order("invoices.id")
  end
end
