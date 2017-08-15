class Api::V1::Transactions::SearchController < ApplicationController

  def show
    render json: Transaction.find_by(params.keys.first.to_sym => params[params.keys.first])
  end

end
