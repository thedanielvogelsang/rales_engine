class Api::V1::Invoices::ItemsController < ApplicationController

  def index
    render json: Invoice.invoice_items(params[:id])
  end

end
