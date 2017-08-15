class Api::V1::InvoiceItems::SearchController < ApplicationController
  def show
    render json: InvoiceItem.find_by(params.keys.first.to_sym => params[params.keys.first])
  end
end
