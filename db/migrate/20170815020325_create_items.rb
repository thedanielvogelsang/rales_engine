class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.text :name
      t.text :description
      t.decimal :unit_price
      t.integer :merchants_id

      t.timestamps
    end
  end
end
