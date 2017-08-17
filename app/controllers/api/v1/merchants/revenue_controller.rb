class Api::V1::Merchants::RevenueController < ApplicationController

  def show
    merchant = Merchant.find(params[:id]) if params[:id]
    date = search_params[:date]
    if search_params[:date] && search_params[:id].nil?
      render json: {"total_revenue": Invoice.revenue_by_date(date)}
    elsif search_params[:id] && search_params[:date].nil?
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
