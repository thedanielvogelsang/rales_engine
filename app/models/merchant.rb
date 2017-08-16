class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items

  def revenue_by_merchant
    revenue = invoices
      .joins(:transactions, :invoice_items)
      .where(transactions: {result: "success"})
      .sum("invoice_items.unit_price * invoice_items.quantity")
      revenue = '%.2f' % (revenue.to_i/100.0)
  end
end
