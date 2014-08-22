require 'feature_helper'

describe 'checking out' do
  context 'the user is not signed in' do
    context 'the cart is empty' do
      it 'redirects to items' do
        order = Order.create()
        visit order_path(order)

        click_on("Checkout")

        expect(current_path).to eq(items_path)
      end
    end

    context 'the cart is not empty' do
      it 'creates a new order' do
        item = Item.create(title: "Chocolate", price: 3.00, status: 1)
        order = Order.create()
        order_item = OrderItem.create(order: order, item: item)

        visit order_path(order_item.order)

        click_on("Checkout")

        expect(current_path).to eq(signin_path)
      end
    end
  end
end
