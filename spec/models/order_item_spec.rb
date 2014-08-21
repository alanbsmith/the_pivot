require 'rails_helper'

RSpec.describe OrderItem, :type => :model do
  describe 'total price' do
   it 'calculates the total price of an item ' do
     price = 5.00
     item = Item.create(title: "Vanilla", price: price)

     order_item = OrderItem.create(order_id: 1, item: item)

     expect(order_item.total_price).to eq(price)
   end

   it 'calculates the total price of mulitple items' do
     price = 5.00
     item = Item.create(title: 'Vanilla', price: price)

     order_item = OrderItem.create(order_id: 1, item: item, quantity: 2)

     expect(order_item.total_price).to eq(price * 2)
   end
 end
end
