class OrderItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :order

  def create
    if current_item
    current_order.order_items.create(order_id: , item_id)
    current_order.order_items.
  end
end
