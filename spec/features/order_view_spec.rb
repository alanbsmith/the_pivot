require 'feature_helper'

RSpec.describe "the order view", type: :feature do

  context 'user is signed in' do
    before(:each) do
      @default_user = User.create(email: "user@example.com", password: "userpassword", password_confirmation: "userpassword",
                        first_name: "user", last_name: "whatever", role: "default")
      visit home_path
    end

    it 'creates an order' do
      default_login

      click_link('View Order')


    end

    it 'shows an order' do
    end

    it 'edits an order' do
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
