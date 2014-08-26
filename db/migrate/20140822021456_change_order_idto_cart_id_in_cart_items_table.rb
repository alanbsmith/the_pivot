class ChangeOrderIdtoCartIdInCartItemsTable < ActiveRecord::Migration
  def change
    rename_column(:cart_items, :order_id, :cart_id)
  end
end
