class Customer < ApplicationRecord
  has_many :invoices
  has_many :merchants, through: :invoices

  def favorite_merchant
    merchants.select("merchants.*, count(merchants.id) AS merch_count")
      .joins(:invoices => [:transactions])
      .merge(Transaction.successful)
      .group("merchants.id")
      .order("merch_count DESC")
      .first
  end

  def self.favorite(id)
    find(Invoice.joins(:transactions)
                  .merge(Transaction.successful)
                  .group(:customer_id)
                  .where(merchant_id: id)
                  .order('count_id DESC').limit(1).count(:id).first[0])
  end

  def self.customers_pending(id)
    joins(:invoices)
      .merge(Invoice.where(status: 'pending'))
      .where(invoices: {merchant_id: id})
  end

  def self.customer_invoices(id)
    find(id).invoices.order("invoices.id")
  end

end
