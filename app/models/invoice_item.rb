class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice

  def self.invoiceitems_invoices(id)
    find(id).invoice
  end

  def self.invoiceitems_item(id)
    find(id).item
  end

  def self.random_invoiceitem
    limit(1).order("RANDOM()")
  end

end
