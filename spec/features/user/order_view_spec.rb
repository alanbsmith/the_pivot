require 'feature_helper'

describe "the order view", type: :feature do

  context 'user is signed in' do
    before(:each) do
      @default_user = User.create(email: "user@example.com", password: "userpassword", password_confirmation: "userpassword",
                        first_name: "user", last_name: "whatever")

      @order  = User.find_by(email: "user@example.com").orders.create(user_id: @default_user.id)
      visit home_path
    end

    it 'creates an application' do
      category = FactoryGirl.create(:category)
      item     = FactoryGirl.create(:listing)
      
      default_login

      visit listings_path
      click_on('Add Job To Cart')
      click_on('Your Cart')
      click_on('Apply')
      click_on('Complete Order')
      click_on('Dashboard')
      click_on('Previous Applications')

      expect(page).to have_content('Worker')
      click_on('Worker')

      expect(page).to have_content('Do work son')
    end
  end

  context 'user is not signed in' do
    it 'goes to menu when they try to access orders' do
      visit orders_path
      expect(current_path).to eq(listings_path)
    end

    it 'goes to menu when they try to access an order' do
      visit 'orders/1'
# need this functionality
      expect(current_path).to eq(listings_path)
    end
  end
end