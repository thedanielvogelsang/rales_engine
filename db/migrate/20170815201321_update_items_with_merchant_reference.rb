class UpdateItemsWithMerchantReference < ActiveRecord::Migration[5.1]
  def change
    remove_column :items, :merchant_id
    add_reference :items, :merchant, index: true
  end
end
