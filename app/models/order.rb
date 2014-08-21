class Order < ActiveRecord::Base
  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items

  def add_item(item_id)
    current_item = order_items.find_by(item_id: item_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = order_items.build(item_id: item_id)
    end
    current_item
  end
  

  def total_price
    order_items.to_a.sum { |order_item| order_item.total_price }
  end
end

# migration
# add_index :order_items, [:item_id, :order_id], unique: true
# model level validation on OrderItem -> friendly errors
