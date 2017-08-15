class Api::V1::Items::SearchController < ApplicationController
  def show
    render json: Item.find_by(params.keys.first.to_sym => params[params.keys.first])
  end
  def index
    render json: Item.where(params.keys.first.to_sym => params[params.keys.first])
  end
end
