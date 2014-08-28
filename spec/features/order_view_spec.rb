require 'feature_helper'

RSpec.describe "the order view", type: :feature do

  context 'user is signed in' do
    before(:each) do
      @default_user = User.create(email: "user@example.com", password: "userpassword", password_confirmation: "userpassword",
                        first_name: "user", last_name: "whatever", role: "default")

      @order  = User.find_by(email: 'user@example.com').orders.create(status: "ordered", receiving: "Delivery")
      visit home_path
    end

    it 'creates an order' do
      category = Category.create(title: "Chocolate", description: "Yum")
      item = Item.create(title: "Chocolate", price: 3.00, status: 1)
      category.items << item

      default_login

      visit items_path

      click_on('Add To Cart')

      click_on('Cart')

      click_on('Checkout')

      click_on('Complete Order')

      click_on('View Orders')

      expect(page).to have_content('ordered')
    end

    it 'shows an order' do
      default_login

      click_link('View Orders')

      click_on('Order')

      expect(page).to have_content('Quantity')
    end

    it 'shows all the orders' do
      default_login

      click_link('View Orders')

      expect(page).to have_link('Order')
    end

    it 'edits an order' do
      default_login

      click_link('View Orders')

      click_on('Order')

      click_on('Cancel')

      expect(current_path).to eq(orders_path)

      expect(page).to have_content("cancelled")
    end
  end

  context 'user is not signed in' do
    it 'goes to menu when they try to access orders' do
      visit orders_path

      expect(current_path).to eq(items_path)
    end

    it 'goes to menu when they try to access an order' do
      visit 'orders/1'

      expect(current_path).to eq(items_path)
    end
  end
end
