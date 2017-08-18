class Api::V1::Invoices::SearchController < ApplicationController

  def show
    render json: Invoice.find_by(params.keys.first.to_sym => params[params.keys.first])
  end

  def index
    render json: Invoice.where(params.keys.first.to_sym => params[params.keys.first])
  end
  
end
