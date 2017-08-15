class AddCustomeridToInvoices < ActiveRecord::Migration[5.1]
  def change
    remove_column :invoices, :customer_id
    add_reference :invoices, :customer, index: true
  end
end
