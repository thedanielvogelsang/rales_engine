class Api::V1::Items::SearchController < ApplicationController

  def show
    if search_params[:unit_price]
      render json: Item.return_by_price(search_params[:unit_price])
    else
      render json: Item.where(search_params).order(:id).to_a.flatten.first
    end
  end

  def index
    if search_params[:unit_price]
      render json: Item.return_all_by_price(search_params[:unit_price])
    else
      render json: Item.where(search_params).to_a.flatten
    end
  end

private

  def search_params
    params.permit(:id, :name, :description, :created_at, :updated_at, :unit_price, :merchant_id)
  end

end
