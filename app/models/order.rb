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
    order_items.to_a.sum { |item| item.total_price }
  end
end



