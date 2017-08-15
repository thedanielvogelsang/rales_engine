class ChangeItems < ActiveRecord::Migration[5.1]
  def change
    rename_column :items, :merchants_id, :merchant_id
  end
end
