require 'rails_helper'

RSpec.describe Cart, :type => :model do
  describe '#total_price' do
    it 'calculates the total of an cart' do
      cart = Cart.create
      item_1  = Item.create(title: "Vanilla", price: 3.50)
      item_2  = Item.create(title: "Chocolate", price: 4.00)

      cart.cart_items.create(cart: cart, item: item_1, quantity: 2)
      cart.cart_items.create(cart: cart, item: item_2)


      expect(cart.total_price).to eq(11.00)
    end
  end
end
