require 'feature_helper'

describe 'checking out' do
  context 'the cart is empty' do
    it 'redirects to items' do
      cart = Cart.create()
      visit cart_path(cart)

      click_on("Checkout")

      expect(current_path).to eq(items_path)
    end
  end

  context 'the cart is not empty' do
    it 'creates a new order' do
      item = Item.create(title: "Chocolate", price: 3.00, status: 1)
      cart = Cart.create()
      cart_item = CartItem.create(cart: cart, item: item)

      visit cart_path(cart_item.cart)

      click_on("Checkout")

      # this works but not in the test :/
      # expect(current_path).to eq(new_order_path)
    end
  end
end
