require 'feature_helper'

RSpec.describe 'the User view', type: :feature do

  describe 'the register view' do
    before(:each) do
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
  end

end
