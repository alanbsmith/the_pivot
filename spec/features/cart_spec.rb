require 'feature_helper'

describe 'manipulating the cart' do
  describe 'adding items to cart', type: :feature do
    context 'when there are no items in the cart' do

      it 'adds one item to the cart' do
        item = Item.create(title: "Chocolate", price: 3.00, status: 1)
        visit items_path

        click_on('Add To Cart')

        expect(current_path).to eq(items_path)

        click_on('Cart')

        within('.order-items') do
          expect(page).to have_content('1')
        end
      end

      it 'totals the order' do
        item = Item.create(title: "Chocolate", price: 3.00, status: 1)
        visit items_path

        click_on('Add To Cart')

        click_on('Cart')

        within('.order-items') do
          expect(page).to have_content('$3.00')
        end
      end
    end

    context 'when there are items in the cart' do
      it 'adds one item to the cart' do
        item = Item.create(title: "Chocolate", price: 3.00, status: 1)
        visit items_path

        2.times do
          click_on('Add To Cart')
        end

        click_on('Cart')

        within('.order-items') do
          expect(page).to have_content('2')
        end
      end

      it 'totals the order' do
        item = Item.create(title: "Chocolate", price: 3.00, status: 1)

        2.times do
          visit items_path

          click_on('Add To Cart')
        end

        click_on('Cart')

        within('.order-items') do
          expect(page).to have_content('$6.00')
        end
      end
    end
  end

  describe 'removing items from cart', type: :feature do
    context 'when there are items in the cart' do
      it 'removes one item from the cart' do
        item = Item.create(title: "Chocolate", price: 3.00, status: 1)
        order = Order.create(status: 'cart')
        orderitem = OrderItem.create(order: order, item: item)
        visit order_path(orderitem.order)

        within('.order-items') do
          expect(page).to have_content('Chocolate')
        end

        click_on('Remove From Cart')

        within('.order-items') do
          expect(page).to_not have_content('Chocolate')
        end
      end

      it 'changes the total of the order' do
        item_1 = Item.create(title: "Chocolate", price: 3.00, status: 1)
        item_2 = Item.create(title: "Vanilla", price: 2.50, status: 1)
        order = Order.create(status: 'cart')
        orderitem = OrderItem.create(order: order, item: item_1, quantity: 2)
        orderitem = OrderItem.create(order: order, item: item_2, quantity: 1)

        visit order_path(orderitem.order)

        within('.order-items') do
          expect(page).to have_content('$8.50')
        end

        within('.order-items') do
          first(:button, 'Remove From Cart').click
        end

        within('.order-items') do
          expect(page).to have_content('$2.50')
        end
      end
    end
  end
end
