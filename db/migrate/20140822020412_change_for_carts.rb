class ChangeForCarts < ActiveRecord::Migration
  def change
    rename_table(:order_items, :cart_items)
    add_index :cart_items, [:item_id, :order_id], unique: true
  end
end
