class Api::V1::Invoices::InvoiceItemsController < ApplicationController

  def index
    render json: Invoice.invoice_invoiceitems(params[:id])
  end

end
