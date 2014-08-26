require 'feature_helper'

describe "admin_categories", type: :feature do
  before(:each) do

    @admin_user = User.create(email: "admin@example.com", password: "adminpassword", password_confirmation: "adminpassword",
                        first_name: "admin", last_name: "whatever", role: "admin")

    @default_user = User.create(email: "user@example.com", password: "userpassword", password_confirmation: "userpassword",
                      first_name: "user", last_name: "whatever", role: "default")
    @order1 = @default_user.orders.create(status: "Paid", receiving: "Delivery")
    @order2 = @default_user.orders.create(status: "Paid", receiving: "Delivery")
    @orders = Order.all
    visit home_path

  end

  it 'shows a list of orders to the admin' do
    admin_login
    visit administrator_orders_path
    @orders.each do |order|
      expect(page).to have_content(order.user.first_name)
    end
  end

  



  it 'edits a status of an order' do
    pending
    admin_login
    visit administrator_orders_path

    order     = @orders.first
    old_category = order.created_at

    within('//table') do
      first(:link, 'Edit').click
    end
    page.fill_in('Title', with: 'Chocomore')
    page.click_button('Update this Order')

    expect(current_path).to eq(administrator_orders_path)
    expect(page).to have_content('Chocomore')
    expect(page).to_not have_content(old_order)
  end
end
