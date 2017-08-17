class Merchant < ApplicationRecord
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :items

  def revenue_by_merchant
    revenue = invoices
      .joins(:transactions, :invoice_items)
      .where(transactions: {result: "success"})
      .sum("invoice_items.unit_price * invoice_items.quantity")
    revenue = '%.2f' % (revenue.to_i/100.0)
  end

  def revenue_by_date(date)
    revenue = invoices
      .where(created_at: date)
      .joins(:transactions, :invoice_items)
      .where(transactions: {result: "success"})
      .sum("invoice_items.unit_price * invoice_items.quantity")
    revenue = '%.2f' % (revenue.to_i/100.0)
  end

  def self.most_items(qty = nil)
    select("merchants.*, sum(invoice_items.quantity) AS total_qty")
      .joins(:invoices => [:transactions, :invoice_items])
      .merge(Transaction.successful)
      .group("merchants.id")
      .order("total_qty DESC").limit(qty)
  end

  def self.most_revenue(qty = nil)
     select("merchants.*, sum(invoice_items.unit_price * invoice_items.quantity) AS total_rev")
                  .joins(:invoices => [:transactions, :invoice_items])
                  .merge(Transaction.successful)
                  .group(:id)
                  .limit(qty)
                  .order("total_rev DESC")
  end

  def customers
    Customer.joins(:invoices).where(invoices: {merchant_id: self.id}).distinct
  end
end
