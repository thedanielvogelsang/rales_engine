class Api::V1::Merchants::RevenueController < ApplicationController

  def show
    merchant = Merchant.find(params[:id]) if params[:id]
    if search_params[:date] && search_params[:id].nil?
      render json: Invoice.revenue_by_date(search_params[:date]), serializer: TotalrevenueSerializer
    elsif search_params[:id] && search_params[:date].nil?
      render json: merchant.revenue_by_merchant, serializer: RevenueSerializer
    else
      render json: merchant.revenue_by_date(search_params[:date]), serializer: RevenueSerializer
    end
  end

  def index
    render json: Merchant.most_revenue(search_params[:quantity])
  end

  private

  def search_params
    params.permit(:id, :date, :quantity)
  end

end
