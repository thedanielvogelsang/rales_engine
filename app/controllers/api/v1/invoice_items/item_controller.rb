class Api::V1::InvoiceItems::ItemController < ApplicationController

  def show
    render json: InvoiceItem.invoiceitems_item(params[:id])
  end

end
