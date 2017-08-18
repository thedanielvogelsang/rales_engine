class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice

  def self.invoiceitems_invoices(id)
    find(id).invoice
  end
end
