require 'feature_helper'

describe 'manipulating the cart' do
  before(:each) do
    category = FactoryGirl.create(:category)
    item     = FactoryGirl.create(:item)
  end

  it 'creates a cart' do
    visit items_path

    click_on('Add To Cart')

    expect(page).to have_content('Cart')
  end

  it 'can not be access unless it exists' do
    visit '/carts/wibble'

    expect(current_path).to eq(items_path)
    expect(page).to have_content('Invalid cart')
  end

  it 'removes all items from cart' do
    visit items_path

    click_on('Add To Cart')

    expect(current_path).to eq(items_path)

    click_on('Cart')

    click_on('Empty Cart')

    expect(current_path).to eq(items_path)
  end


  it 'checks out' do
    visit items_path

    click_on('Add To Cart')

    expect(current_path).to eq(items_path)

    click_on('Cart')

    click_on("Checkout")

    expect(current_path).to eq(signin_path)
  end

  describe 'adding items to cart', type: :feature do
    context 'when there are no items in the cart' do

      it 'adds one item to the cart' do
        visit items_path

        click_on('Add To Cart')

        expect(current_path).to eq(items_path)

        click_on('Cart')

        expect(page).to have_selector("input[value = '1']")
      end

      it 'totals the cart' do
        visit items_path

        click_on('Add To Cart')

        click_on('Cart')

        within('.cart-items') do
          expect(page).to have_content('$6.50')
        end
      end
    end

    context 'when there are items in the cart' do
      it 'adds one item to the cart' do
        visit items_path

        2.times do
          click_on('Add To Cart')
        end

        click_on('Cart')

        expect(page).to have_selector("input[value = '2']")
      end

      it 'totals the cart' do
        2.times do
          visit items_path

          click_on('Add To Cart')
        end

        click_on('Cart')

        within('.cart-items') do
          expect(page).to have_content('$13.00')
        end
      end

      it 'edits the quantity in the cart' do
        visit items_path

        click_on('Add To Cart')

        expect(current_path).to eq(items_path)

        click_on('Cart')

        within('div.field') do
          fill_in('cart_item_quantity', :with => 5)
          click_on('save')
        end

        within('tr.total_line') do
          expect(page).to have_content('$32.50')
        end
      end
    end
  end
  #
  describe 'removing items from cart', type: :feature do
    let(:cart) { FactoryGirl.create(:cart) }

    before(:each) do
      @cart_item = FactoryGirl.create(:cart_item)
    end

    context 'when there are items in the cart' do
      it 'removes one item from the cart' do
        visit cart_path(@cart_item.cart)

        within('.cart-items') do
          expect(page).to have_content('Chocolate')
        end

        click_on('Remove From Cart')

        within('.cart-items') do
          expect(page).to_not have_content('Chocolate')
        end
      end

      it 'changes the total of the cart' do
        visit cart_path(@cart_item.cart)

        within('.cart-items') do
          expect(page).to have_content('$6.50')
        end

        within('.cart-items') do
          first(:button, 'Remove From Cart').click
        end

        within('.cart-items') do
          expect(page).to have_content('$0.00')
        end
      end
    end
  end
end
