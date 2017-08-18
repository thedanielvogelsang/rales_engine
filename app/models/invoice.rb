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
    Invoice.joins(:invoice_items)
        .where(created_at: date)
        .sum("invoice_items.unit_price * invoice_items.quantity")
  end

  def self.invoice_customers(id)
    find(id).customer
  end

  def self.invoice_invoiceitems(id)
    find(id).invoice_items
  end

  def self.invoice_items(id)
    Invoice.find(id).items
  end

  def self.invoice_merchants(id)
    find(id).merchant
  end

  def self.random_invoices
    limit(1).order("RANDOM()")
  end

end
