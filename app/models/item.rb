class Item < ApplicationRecord
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  belongs_to :merchant

  def best_day
    invoices.joins(:invoice_items)
      .group(:id)
      .order('sum(invoice_items.quantity) DESC, invoices.created_at DESC')
      .first
  end
end
