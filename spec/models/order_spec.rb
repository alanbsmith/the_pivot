require 'rails_helper'

RSpec.describe Order, :type => :model do
  it 'adds cart items from the cart to the order' do
    order = Order.create
    cart  = Cart.create

    item_1  = Item.create(title: "Vanilla", price: 3.50)
    item_2  = Item.create(title: "Chocolate", price: 4.00)

    cart_item1 = cart.cart_items.create(cart: cart, item: item_1, quantity: 2)
    cart_item2 = cart.cart_items.create(cart: cart, item: item_2)

    order.add_cart_items_from_cart(cart)

    expect(order.cart_items).to include(cart_item1)
  end
end
