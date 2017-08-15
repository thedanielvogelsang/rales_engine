class UpdateInvoicesWithMerchantid < ActiveRecord::Migration[5.1]
  def change
    remove_column :invoices, :merchant_id
    add_reference :invoices, :merchant, index: true
  end
end
