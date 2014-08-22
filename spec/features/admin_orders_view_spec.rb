require 'feature_helper'

describe "admin_orders", type: :feature do

  before(:each) do
    @orders = Order.all
    visit home_path
  end

  it "shows orders by status paid" do
    admin_login
    visit administrator_orders_path
    @orders.each do |order|
      expect(page).to have_content(order.user_id)
      expect(page).to have_content(order.total)
      expect(page).to have_content("Paid")
    end
  end

  it "shows orders by status pending" do
    admin_login
    visit administrator_orders_path
    @orders.each do |order|
      expect(page).to have_content(order.user_id)
      expect(page).to have_content(order.total)
      expect(page).to have_content("Pending")
    end
  end

  it "shows orders by status cancel" do
    admin_login
    visit administrator_orders_path
    @orders.each do |order|
      expect(page).to have_content(order.user_id)
      expect(page).to have_content(order.total)
      expect(page).to have_content("Cancel")
    end
  end

end
