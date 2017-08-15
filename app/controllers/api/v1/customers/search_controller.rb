class Api::V1::Customers::SearchController < ApplicationController

  def show
    render json: Customer.find_by(params.keys.first.to_sym => params[params.keys.first])
  end

end
