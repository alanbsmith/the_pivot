# require 'rails_helper'

# RSpec.describe Order, :type => :model do
#   it 'adds cart items from the cart to the order' do
#     order = Order.create
#     cart  = FactoryGirl.create(:cart)

#     item = FactoryGirl.create(:item)

#     cart_item = cart.cart_items.create(cart: cart, item: item, quantity: 2)

#     order.add_cart_items_from_cart(cart)

#     expect(order.cart_items).to include(cart_item)
#   end
# end
