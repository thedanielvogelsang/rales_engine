class Api::V1::Merchants::SearchController < ApplicationController

  def show
    render json: Merchant.find_by(params.keys.first.to_sym => params[params.keys.first])
  end

  def index
    render json: Merchant.where(params.keys.first.to_sym => params[params.keys.first])
  end

end
