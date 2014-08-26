require 'rails_helper'

RSpec.describe CartItem, :type => :model do
  describe 'total price' do
   it 'calculates the total price of an item ' do
     price = 5.00
     item = Item.create(title: "Vanilla", price: price)

     cart_item = CartItem.create(cart_id: 1, item: item)

     expect(cart_item.total_price).to eq(price)
   end

   it 'calculates the total price of mulitple items' do
     price = 5.00
     item = Item.create(title: 'Vanilla', price: price)

     cart_item = CartItem.create(cart_id: 1, item: item, quantity: 2)

     expect(cart_item.total_price).to eq(price * 2)
   end
 end
end
