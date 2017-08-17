class Item < ApplicationRecord
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  belongs_to :merchant

  def self.most_revenue(qty = nil)
     select("items.*, sum(invoice_items.unit_price * invoice_items.quantity) AS total_rev")
            .joins(:merchant => [:invoices])
            .joins(:invoices => [:transactions, :invoice_items])
            .group("items.id")
            .limit(qty)
            .order("total_rev DESC")
  end

  def total_revenue
    revenue = invoices.joins(:transactions)
        .merge(Transaction.successful)
        .sum("invoice_items.unit_price * invoice_items.quantity")
    revenue = '%.2f' % (revenue.to_i/100.0)
  end
end
