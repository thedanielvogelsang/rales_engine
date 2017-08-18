class Api::V1::Customers::TransactionsController < ApplicationController

  def index
    id = Customer.find(params[:id]).id
    render json: Transaction.customer_transactions(id)
  end

end
