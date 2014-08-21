require 'rails_helper'

RSpec.describe Order, :type => :model do
  describe '#total_price' do
    it 'calculates the total of an order' do
      order = Order.create(status: 'cart')
      item_1  = Item.create(title: "Vanilla", price: 3.50)
      item_2  = Item.create(title: "Chocolate", price: 4.00)

      order.order_items.create(order: order, item: item_1, quantity: 2)
      order.order_items.create(order: order, item: item_2)


      expect(order.total_price).to eq(11.00)
    end
  end
end
