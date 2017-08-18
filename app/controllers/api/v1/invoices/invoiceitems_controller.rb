class Api::V1::Invoices::InvoiceitemsController < ApplicationController

  def index
    render json: Invoice.invoice_invoiceitems(params[:id])
  end

end
