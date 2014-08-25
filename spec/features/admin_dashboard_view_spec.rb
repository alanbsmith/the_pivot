require 'feature_helper'
require 'pry'
describe 'the admin dashboard' do

  before(:each) do
    @admin_user = User.create(email: "admin@example.com", password: "adminpassword", password_confirmation: "adminpassword",
                        first_name: "admin", last_name: "whatever", role: "admin")


  


    visit home_path
  end

  context 'admin user' do
    it 'can log in as admin' do
      pending
      admin_login
      expect(current_path).to eq(administrator_admins_path)
    end

    it 'displays a dashboard link after log in' do
      admin_login
      expect(page).to have_link("Dashboard")
    end

    it 'dashboard link takes admin to dashboard' do
      admin_login
      click_link("Dashboard")
      expect(current_path).to eq(administrator_admins_path)
    end

    it 'has a link for manage categories' do
      admin_login
      visit administrator_admins_path
      expect(page).to have_link("Manage Categories")
    end

    it 'has a link to manage menu items' do
      admin_login
      visit administrator_admins_path
      expect(page).to have_link("Manage Items")
    end

    it 'has a link for manage order' do
      admin_login
      visit administrator_admins_path
      expect(page).to have_link("Manage Orders")
    end
  end

  context 'guest user' do
    it 'can log in as default user' do
      expect(current_path).to eq(home_path)
    end

    it 'cannot access the administrator items page' do
      visit administrator_items_path
      expect(current_path).to_not eq(administrator_items_path)
    end

    it 'guest user cannot access dashboard link' do
      expect(page).to_not have_link("Dashboard")
    end
  end



  def admin_login
    click_link('Sign In')
    expect(current_path).to eq(signin_path)
    fill_in("Email", with: "admin@example.com")
    fill_in("Password", with: "adminpassword")
    click_button('Signin')
  end

end
