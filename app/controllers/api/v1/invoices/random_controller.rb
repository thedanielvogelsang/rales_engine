class Api::V1::Invoices::RandomController < ApplicationController

  def show
    render json: Invoice.random_invoices
  end

end
