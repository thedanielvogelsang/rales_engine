class Api::V1::InvoiceItems::ItemsController < ApplicationController

  def show
    render json: InvoiceItem.invoiceitems_item(params[:id])
  end

end
