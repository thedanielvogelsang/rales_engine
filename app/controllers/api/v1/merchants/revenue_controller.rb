class Api::V1::Merchants::RevenueController < ApplicationController

  def show
    merchant = Merchant.find(params[:id])
    if search_params[:date].nil?
      render json: {"revenue": merchant.revenue_by_merchant}
    else
      render json: {"revenue": merchant.revenue_by_date(search_params[:date])}
    end
  end

  def index
    render json: Merchant.most_revenue(search_params[:quantity])
  end

  def search_params
    params.permit(:id, :date, :quantity)
  end

end
