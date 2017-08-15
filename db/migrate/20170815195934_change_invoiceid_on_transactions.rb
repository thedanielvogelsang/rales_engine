class ChangeInvoiceidOnTransactions < ActiveRecord::Migration[5.1]
  def change
    remove_column :transactions, :invoice_id
    add_reference :transactions, :invoice, index: true
  end
end
