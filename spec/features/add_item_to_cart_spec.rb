require 'feature_helper'

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
