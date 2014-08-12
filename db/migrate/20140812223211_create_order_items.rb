class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.references :item, index: true
      t.references :order, index: true
      t.integer :quantity, default: 1

      t.timestamps
    end
  end
end
