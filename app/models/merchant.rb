class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items

  def customers
    Customer.joins(:invoices).where(invoices: {merchant_id: self.id}).distinct
  end
end
