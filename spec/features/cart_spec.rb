require 'feature_helper'

describe 'manipulating the cart' do
  it 'removes items from cart' do
    item = Item.create(title: "Chocolate", price: 3.00, status: 1)
<<<<<<< HEAD
    visit items_path
=======
    cart = Cart.create()
    cartitem = CartItem.create(cart: cart, item: item)
    visit cart_path(cartitem.cart)
>>>>>>> development-cart

    click_on('Add To Cart')

    expect(current_path).to eq(items_path)

    click_on('Cart')
    click_on('Empty Cart')

    expect(current_path).to eq(items_path)
  end

  it 'checks out' do
    item = Item.create(title: "Chocolate", price: 3.00, status: 1)
<<<<<<< HEAD
    visit items_path

    click_on('Add To Cart')

    expect(current_path).to eq(items_path)

    click_on('Cart')

=======
    cart = Cart.create()
    cartitem = CartItem.create(cart: cart, item: item)
    visit cart_path(cartitem.cart)
>>>>>>> development-cart

    click_on("Checkout")

    expect(current_path).to eq(signin_path)
  end

  describe 'adding items to cart', type: :feature do
    context 'when there are no items in the cart' do

      it 'adds one item to the cart' do
        item = Item.create(title: "Chocolate", price: 3.00, status: 1)
        visit items_path

        click_on('Add To Cart')

        expect(current_path).to eq(items_path)

        click_on('Cart')

        within('.cart-items') do
          expect(page).to have_content('1')
        end
      end

      it 'totals the cart' do
        item = Item.create(title: "Chocolate", price: 3.00, status: 1)
        visit items_path

        click_on('Add To Cart')

        click_on('Cart')

        within('.cart-items') do
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

        within('.cart-items') do
          expect(page).to have_content('2')
        end
      end

      it 'totals the cart' do
        item = Item.create(title: "Chocolate", price: 3.00, status: 1)

        2.times do
          visit items_path

          click_on('Add To Cart')
        end

        click_on('Cart')

        within('.cart-items') do
          expect(page).to have_content('$6.00')
        end
      end
    end
  end

  describe 'removing items from cart', type: :feature do
    context 'when there are items in the cart' do
      it 'removes one item from the cart' do
        item = Item.create(title: "Chocolate", price: 3.00, status: 1)
        cart = Cart.create()
        cartitem = CartItem.create(cart: cart, item: item)
        visit cart_path(cartitem.cart)

        within('.cart-items') do
          expect(page).to have_content('Chocolate')
        end

        click_on('Remove From Cart')

        within('.cart-items') do
          expect(page).to_not have_content('Chocolate')
        end
      end

      it 'changes the total of the cart' do
        item_1 = Item.create(title: "Chocolate", price: 3.00, status: 1)
        item_2 = Item.create(title: "Vanilla", price: 2.50, status: 1)
        cart = Cart.create()
        cartitem = CartItem.create(cart: cart, item: item_1, quantity: 2)
        cartitem = CartItem.create(cart: cart, item: item_2, quantity: 1)

        visit cart_path(cartitem.cart)

        within('.cart-items') do
          expect(page).to have_content('$8.50')
        end

        within('.cart-items') do
          first(:button, 'Remove From Cart').click
        end

        within('.cart-items') do
          expect(page).to have_content('$2.50')
        end
      end
    end
  end
end
