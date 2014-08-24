require 'feature_helper'

describe "admin_user_dashboard", type: :feature do
  before(:each) do

    User.create(email: "duck@example.com", password: "userpassword", 
                password_confirmation: "userpassword", first_name: "Duck", 
                last_name: "Dogers", role: "default", street: "1510 Blake st.",
                city: "Denver", state: "CO", zipcode: "80123")
    User.create(email: "roger@example.com", password: "userpassword", 
                password_confirmation: "userpassword", first_name: "Roger", 
                last_name: "Doger", role: "default", street: "1511 Blake st.",
                city: "Denver", state: "CO", zipcode: "80123")
    User.create(email: "admin@example.com", password: "admin123", 
                password_confirmation: "admin123", first_name: "Big", 
                last_name: "Boss", role: "admin", street: "1512 Blake st.",
                city: "Denver", state: "CO", zipcode: "80123")
    
    @users = User.all
    @user  = User.first

    visit administrator_users_path
  end

  it 'shows the view to an admin' do
    expect(current_path).to eq(administrator_users_path)

    @users.each do |user|
      expect(page).to have_content(user.id)
      expect(page).to have_content(user.first_name)
      expect(page).to have_content(user.last_name)
      expect(page).to have_content(user.email)
      expect(page).to have_content(user.role)
      expect(page).to have_link('Address', href: administrator_address_path(user))
    end
  end

  it 'has links to other dashboards' do
    expect(page).to have_link('Dashboard Home',       href: administrator_admins_path)
    expect(page).to have_link('Menu Items Dashboard', href: administrator_items_path)
    expect(page).to have_link('Categories Dashboard', href: administrator_categories_path)
    expect(page).to have_link('Orders Dashboard',     href: administrator_orders_path)
  end

  it 'can find a users address' do
    within('//table') do
      first(:link, 'Address').click
    end
    expect(current_path).to eq(administrator_address_path(@user))

    expect(page).to have_content(@user.first_name)
    expect(page).to have_content(@user.last_name)
    expect(page).to have_content(@user.street)
    expect(page).to have_content(@user.city)
    expect(page).to have_content(@user.state)
    expect(page).to have_content(@user.zipcode)

    expect(page).to have_link('Order History',        href: user_order_path(@user))
    expect(page).to have_link('Dashboard Home',       href: administrator_admins_path)
    expect(page).to have_link('Users Dashboard',      href: administrator_users_path)
    expect(page).to have_link('Menu Items Dashboard', href: administrator_items_path)
    expect(page).to have_link('Categories Dashboard', href: administrator_categories_path)
    expect(page).to have_link('Orders Dashboard',     href: administrator_orders_path)
  end

  it 'can find a users order history' do
    within('//table') do
      first(:link, 'Address').click
    end

    click_link('Order History')

    expect(current_path).to eq(user_order_path(@user))

    # expect(page).to have_content(@user.order something?)

  end

end