require 'feature_helper'

describe 'the User view', type: :feature do

  describe 'the register view' do
      before(:each) do
        @default_user = User.create(email: "user@example.com", password: "userpassword", password_confirmation: "userpassword",
                          first_name: "user", last_name: "whatever", role: "default")

      visit home_path
    end

    it 'has link to register user' do
      expect(page).to have_link('Register')
    end

    it 'displays the registration page' do
      click_link('Register')
      expect(current_path).to eq(register_path)
    end

    it 'can register a user' do
      User.delete_all
      users = User.all
      expect(users.count).to eq(0)
      visit register_path
      fill_in("Email", with: "user@example.com")
      fill_in("First name", with: "bob")
      fill_in("Last name", with: "gu")
      fill_in("Password", with: "mypassword")
      fill_in("Password confirmation", with: "mypassword")
      click_button("Create User")
      registered_user = User.last
      expect(registered_user.email).to eq("user@example.com")
    end

    it 'can log in as default user' do
      default_login
      expect(current_path).to eq(items_path)
    end

    it 'cannot access the administrator items page' do
      default_login
      visit administrator_items_path
      expect(current_path).to_not eq(administrator_items_path)
    end

    it 'default user cannot access dashboard link' do
      default_login
      expect(page).to_not have_link("Dashboard")
    end

    it 'default user has a profile link' do
      default_login
      expect(page).to have_link('Profile')
    end

    it 'default user can visit profile page' do
      default_login
      click_link('Profile')
      expect(current_path).to eq(user_path(@default_user))
    end

    it 'profile page displays information about user' do
      visit user_path(@default_user)
      expect(page).to have_content(@default_user.first_name)
      expect(page).to have_content(@default_user.last_name)
    end

    it 'default user has a view orders link' do
      default_login
      expect(page).to have_link('View Orders')
    end

    it 'view orders page should have all associated orders with user' do
      @default_user.orders.create
      @default_user.orders.create
      user_orders = @default_user.orders
      default_login
      click_link("View Orders")
      expect(current_path).to eq(orders_path)
      user_orders.each do |order|
        expect(page).to have_content(order.created_at)
      end
    end
  end

end
