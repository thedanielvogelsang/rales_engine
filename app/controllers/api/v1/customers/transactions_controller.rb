class Api::V1::Customers::TransactionsController < ApplicationController
  def index
    id = Customer.find(params[:id]).id
    render json: Transaction.joins(:invoice).merge(Invoice.where(customer_id: id))
  end
end
