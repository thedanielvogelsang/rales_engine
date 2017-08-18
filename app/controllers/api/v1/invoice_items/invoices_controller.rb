class Api::V1::InvoiceItems::InvoicesController < ApplicationController

  def show
    render json: InvoiceItem.invoiceitems_invoices(params[:id])
  end
  
end
