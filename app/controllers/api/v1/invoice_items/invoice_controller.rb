class Api::V1::InvoiceItems::InvoiceController < ApplicationController

  def show
    render json: InvoiceItem.invoiceitems_invoices(params[:id])
  end

end
