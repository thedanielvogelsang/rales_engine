class Api::V1::Items::SearchController < ApplicationController
  def show
    render json: Item.where(search_params).order(:id).to_a.flatten.first
  end
  def index
    render json: Item.where(search_params).to_a.flatten
  end

private
  def search_params
    params.permit(:id, :name, :description, :created_at, :updated_at, :unit_price, :merchant_id)
  end
end
