require 'feature_helper'

describe "admin orders", type: :feature do
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

  it 'the admin can view a single order' do
    admin_login
    visit administrator_orders_path
    first(:link, 'Order Details').click
    expect(current_path).to eq(administrator_order_path(@order1))
    expect(page).to have_content(@order1.user.email)
  end

  it 'the admin can delete a single item from an order' do
    @item1 = Item.create(title: "Vanilla")
    @order_item = @order1.cart_items.create(item_id: "1")
    admin_login
    visit administrator_order_path(@order1)
    click_button("Delete")
    expect(page).to_not have_content(@order_item.item.title)
  end




end
