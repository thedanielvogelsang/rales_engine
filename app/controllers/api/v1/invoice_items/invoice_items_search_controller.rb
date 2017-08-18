require 'bigdecimal'

class Api::V1::InvoiceItems::InvoiceItemsSearchController < ApplicationController
  def show
    if params[:unit_price].nil?
      render json: InvoiceItem.find_by(search_params)
    else
      render json: InvoiceItem.find_by(unit_price: search_params[:unit_price].to_f*100)
    end
  end

  def index
    if params[:unit_price].nil?
      render json: InvoiceItem.where(search_params)
    else
      render json: InvoiceItem.where(unit_price: search_params[:unit_price].to_f*100)
    end
  end

  private

  def search_params
    params.permit(:id, :item_id, :invoice_id, :created_at, :updated_at, :quantity, :unit_price)
  end
end
