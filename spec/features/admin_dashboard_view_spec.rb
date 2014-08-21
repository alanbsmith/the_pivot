require 'feature_helper'

describe 'the admin dashboard' do

  before(:each) do
    @admin_user = User.create(email: "admin@example.com", password: "adminpassword", password_confirmation: "adminpassword",
                        first_name: "admin", last_name: "whatever", role: "admin"
    )
    @default_user = User.create(email: "user@example.com", password: "userpassword", password_confirmation: "userpassword",
                        first_name: "user", last_name: "whatever", role: "default"
    )
    visit home_path
  end

  context 'admin user' do
    it 'can log in as admin' do
      pending
      admin_login
      expect(current_path).to content("Welcome Admin!")
    end

    it 'displays a dashboard link after log in' do
      admin_login
      expect(page).to have_link("Dashboard")
    end

    it 'dashboard link takes admin to dashboard' do
      admin_login
    end
  end

  context 'default user' do
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


  def default_login
    click_link('Sign In')
    expect(current_path).to eq(signin_path)
    fill_in("Email", with: "user@example.com")
    fill_in("Password", with: "userpassword")
    click_button('Signin')
  end

  def admin_login
    click_link('Sign In')
    expect(current_path).to eq(signin_path)
    fill_in("Email", with: "admin@example.com")
    fill_in("Password", with: "adminpassword")
    click_button('Signin')
  end

end
