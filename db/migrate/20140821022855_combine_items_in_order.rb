class CombineItemsInOrder < ActiveRecord::Migration

  def up
    # replace multiple items for a single item in an order with a single item
    Order.all.each do |order|
      # count the number of each item in the cart
      sums = order.order_items.group(:item_id).sum(:quantity)

      sums.each do |item_id, quantity|
        if quantity > 1
          # remove indivual items
          order.order_items.where(item_id: item_id).delete_all

          item = order.order_items.build(item_id: item_id)
          item.quantity = quantity
          item.save!
        end
      end
    end
  end

  def down
    #split items with quantity > 1 into multiple items
    OrderItem.where("quantity > 1").each do |order_item|
      #add individual items
      order_item.quantity.times do
        OrderItem.create order_id: order_item.order_id,
          item_id: order_item.item_id, quantity: 1
      end

      #remove original item
      order_item.destroy
    end
  end
end
