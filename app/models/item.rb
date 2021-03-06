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

  def self.most_items(quantity = nil)
    select("items.*, sum(invoice_items.quantity) AS item_qty")
      .joins(:invoice_items)
      .group("items.id")
      .order("item_qty DESC").limit(quantity)
  end

  def self.return_all_by_price(price)
    price = price.to_f * 100
    Item.where(unit_price: price).to_a.flatten
  end

  def self.return_by_price(price)
    price = '%.2f' % (price.to_f*100)
    Item.where(unit_price: price).order(:id).to_a.flatten.first
  end
end
