class Api::V1::Merchants::FavoriteController < ApplicationController
  def show
    id = Merchant.find(params[:id])
    render json: Customer.find(Invoice.joins(:transactions)
                  .merge(Transaction.successful)
                  .group(:customer_id)
                  .where(merchant_id: id)
                  .order('count_id DESC').limit(1).count(:id).first[0])
    # render json: Customer.find(Invoice.joins(:transactions)
    # .merge(Transaction.successful).where(invoice: {merchant_id: id})
    # .group(:merchant_id).order('count_id DESC')
    # .limit(1).count(:id).first[0])
  end
end
