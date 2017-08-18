class Api::V1::Items::BestdayController < ApplicationController

  def show
    render json: Item.find(params[:id]).best_day, serializer: BestdaySerializer
  end

end
