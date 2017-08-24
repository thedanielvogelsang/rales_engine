class Invoice < ApplicationRecord
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :transactions
  belongs_to :customer
  belongs_to :merchant


  def self.most_expensive(limit = 5)
    select("invoices.id, sum(invoice_items.unit_price * invoice_items.quantity) AS total_rev")
      .joins(:transactions, :invoice_items)
      .where(transactions: { result: "success" })
      .group("invoices.id")
      .order("total_rev DESC")
      .limit(limit)
  end

  def self.revenue_by_date(date)
    # revenue = 
    Invoice.joins(:invoice_items)
        .where(created_at: date)
        .sum("invoice_items.unit_price * invoice_items.quantity")
    # revenue = '%.2f' % (revenue.to_i/100.0)
  end
end
